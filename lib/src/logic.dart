class Logic {
  final _key = 'ܐܑܒܓܔܕܖܗܘܙܚܛܜܝܞܟ';

  String caesarCipherEncryption(String text) {
    String result = '';
    for (int i = 0; i < text.length; i++) {
      int char = text.codeUnitAt(i);
      if (char >= 33 && char <= 47) {
        result += String.fromCharCode(((char - 33 + 3) % 15) + 33);
      } else if (char >= 48 && char <= 57) {
        result += String.fromCharCode(((char - 48 + 3) % 10) + 48);
      } else if (char >= 58 && char <= 64) {
        result += String.fromCharCode(((char - 58 + 3) % 7) + 58);
      } else if (char >= 65 && char <= 90) {
        result += String.fromCharCode(((char - 65 + 3) % 26) + 65);
      } else if (char >= 97 && char <= 122) {
        result += String.fromCharCode(((char - 97 + 3) % 26) + 97);
      } else if (char >= 91 && char <= 96) {
        result += String.fromCharCode(((char - 91 + 3) % 6) + 91);
      } else if (char >= 123 && char <= 126) {
        result += String.fromCharCode(((char - 123 + 3) % 4) + 123);
      } else {
        result += String.fromCharCode(char);
      }
    }
    return result;
  }

  String caesarCipherDecryption(String text) {
    String result = '';
    for (int i = 0; i < text.length; i++) {
      int char = text.codeUnitAt(i);
      if (char >= 33 && char <= 47) {
        result += String.fromCharCode(((char - 33 - 3) % 15) + 33);
      } else if (char >= 48 && char <= 57) {
        result += String.fromCharCode(((char - 48 - 3) % 10) + 48);
      } else if (char >= 58 && char <= 64) {
        result += String.fromCharCode(((char - 58 - 3) % 7) + 58);
      } else if (char >= 65 && char <= 90) {
        result += String.fromCharCode(((char - 65 - 3) % 26) + 65);
      } else if (char >= 97 && char <= 122) {
        result += String.fromCharCode(((char - 97 - 3) % 26) + 97);
      } else if (char >= 91 && char <= 96) {
        result += String.fromCharCode(((char - 91 - 3) % 6) + 91);
      } else if (char >= 123 && char <= 126) {
        result += String.fromCharCode(((char - 123 - 3) % 4) + 123);
      } else {
        result += String.fromCharCode(char);
      }
    }
    return result;
  }

  String railFenceEncryption(String text, int key) {
    List<List<String>> rail = List.generate(key, (index) => []);
    int row = 0;
    bool down = true;
    for (int i = 0; i < text.length; i++) {
      rail[row].add(text[i]);
      if (row == key - 1) {
        down = false;
      } else if (row == 0) {
        down = true;
      }
      if (down) {
        row++;
      } else {
        row--;
      }
    }
    String result = '';
    for (int i = 0; i < rail.length; i++) {
      for (int j = 0; j < rail[i].length; j++) {
        result += rail[i][j];
      }
    }
    return result;
  }

  String railFenceDecryption(String text, int key) {
    List<List<String>> rail = List.generate(key, (index) => []);
    int row = 0;
    bool down = true;
    for (int i = 0; i < text.length; i++) {
      rail[row].add('*');
      if (row == key - 1) {
        down = false;
      } else if (row == 0) {
        down = true;
      }
      if (down) {
        row++;
      } else {
        row--;
      }
    }
    int index = 0;
    for (int i = 0; i < key; i++) {
      for (int j = 0; j < rail[i].length; j++) {
        rail[i][j] = text[index];
        index++;
      }
    }
    String result = '';
    row = 0;
    down = true;
    for (int i = 0; i < text.length; i++) {
      result += rail[row][0];
      rail[row].removeAt(0);
      if (row == key - 1) {
        down = false;
      } else if (row == 0) {
        down = true;
      }
      if (down) {
        row++;
      } else {
        row--;
      }
    }
    return result;
  }

  String vigenereCipherEncryption(String text) {
    String result = '';
    int j = 0;
    for (int i = 0; i < text.length; i++) {
      int char = text.codeUnitAt(i);
      if (char >= 33 && char <= 47) {
        result += String.fromCharCode(
            ((char - 33 + _key.codeUnitAt(j) - 33) % 15) + 33);
      } else if (char >= 48 && char <= 57) {
        result += String.fromCharCode(
            ((char - 48 + _key.codeUnitAt(j) - 33) % 10) + 48);
      } else if (char >= 58 && char <= 64) {
        result += String.fromCharCode(
            ((char - 58 + _key.codeUnitAt(j) - 33) % 7) + 58);
      } else if (char >= 65 && char <= 90) {
        result += String.fromCharCode(
            ((char - 65 + _key.codeUnitAt(j) - 33) % 26) + 65);
      } else if (char >= 97 && char <= 122) {
        result += String.fromCharCode(
            ((char - 97 + _key.codeUnitAt(j) - 33) % 26) + 97);
      } else if (char >= 91 && char <= 96) {
        result += String.fromCharCode(
            ((char - 91 + _key.codeUnitAt(j) - 33) % 6) + 91);
      } else if (char >= 123 && char <= 126) {
        result += String.fromCharCode(
            ((char - 123 + _key.codeUnitAt(j) - 33) % 4) + 123);
      } else {
        result += String.fromCharCode(char);
      }
      j++;
      if (j == _key.length) {
        j = 0;
      }
    }
    return result;
  }

  String vigenereCipherDecryption(String text)  {
    String result = '';
    int j = 0;
    for (int i = 0; i < text.length; i++) {
      int char = text.codeUnitAt(i);
      if (char >= 33 && char <= 47) {
        result += String.fromCharCode(
            ((char - 33 - _key.codeUnitAt(j) + 33) % 15) + 33);
      } else if (char >= 48 && char <= 57) {
        result += String.fromCharCode(
            ((char - 48 - _key.codeUnitAt(j) + 33) % 10) + 48);
      } else if (char >= 58 && char <= 64) {
        result += String.fromCharCode(
            ((char - 58 - _key.codeUnitAt(j) + 33) % 7) + 58);
      } else if (char >= 65 && char <= 90) {
        result += String.fromCharCode(
            ((char - 65 - _key.codeUnitAt(j) + 33) % 26) + 65);
      } else if (char >= 97 && char <= 122) {
        result += String.fromCharCode(
            ((char - 97 - _key.codeUnitAt(j) + 33) % 26) + 97);
      } else if (char >= 91 && char <= 96) {
        result += String.fromCharCode(
            ((char - 91 - _key.codeUnitAt(j) + 33) % 6) + 91);
      } else if (char >= 123 && char <= 126) {
        result += String.fromCharCode(
            ((char - 123 - _key.codeUnitAt(j) + 33) % 4) + 123);
      } else {
        result += String.fromCharCode(char);
      }
      j++;
      if (j == _key.length) {
        j = 0;
      }
    }
    return result;
  }
}