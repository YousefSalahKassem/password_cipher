class Logic {
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
}
