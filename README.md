## Password Cipher

Password Cipher is an encryption - decryption password using caesar cipher encryption.

## Features

1: It supports Android, Ios and Web platform.

2: Have an options like text field in addition visibility and encryption.

3: Password Cipher is now hidden by default. You can show it by clicking on the eye icon.

4: Have an option to encrypt the password using caesar cipher encryption by clicking on the lock icon.

5: Have an option to decrypt the password by clicking on the lock icon again.

6: Have an option to encrypt for characters , numbers and special characters

https://user-images.githubusercontent.com/91211054/190849738-205d0496-6feb-486f-a53c-741b791e96f9.mp4



## Getting started

The Caesar Cipher technique is one of the earliest and simplest methods of encryption technique. It’s simply a type of substitution cipher, i.e., each letter of a given text is replaced by a letter with a fixed number of positions down the alphabet. For example with a shift of 1, A would be replaced by B, B would become C, and so on. The method is apparently named after Julius Caesar, who apparently used it to communicate with his officials. 

Thus to cipher a given text we need an integer value, known as a shift which indicates the number of positions each letter of the text has been moved down. 
The encryption can be represented using modular arithmetic by first transforming the letters into numbers, according to the scheme, A = 0, B = 1,…, Z = 25. Encryption of a letter by a shift n can be described mathematically as. 

E_n(x)=(x+n)mod\ 26       
(Encryption Phase with shift n)

D_n(x)=(x-n)mod\ 26       
(Decryption Phase with shift n)

![ceaserCipher](https://user-images.githubusercontent.com/91211054/190849882-e8d91ad6-8254-49b6-86d8-a516517911a6.png)





## Usage

Example for Password Cipher package and how to use it.

```dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
          body: Center(
          child: Column(
          children: [
            PasswordCipher(
              controller: controller,
              passwordIconColor: Colors.teal,
              encryptIconColor: Colors.teal,
            ),
          ],
      ))),
    );
  }
}

```

## References

1: geeks for geeks: https://www.geeksforgeeks.org/caesar-cipher-in-cryptography/
