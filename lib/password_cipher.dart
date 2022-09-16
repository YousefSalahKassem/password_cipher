library password_cipher;
export 'src/index.dart';


import 'package:flutter/material.dart';
import 'package:password_cipher/src/password_field.dart';

/// A Calculator.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body:  Center(
            child: Column(
              children: [
                PasswordField(controller: controller,),
                MaterialButton(onPressed: (){
                },color: Colors.black,)
              ],
            )
        )
      ),
    );
  }
}

