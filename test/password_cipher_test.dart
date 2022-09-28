import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:password_cipher/password_cipher.dart';

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
                  PasswordCipher(controller: controller,),
                  MaterialButton(onPressed: (){
                  },color: Colors.black,)
                ],
              )
          )
      ),
    );
  }
}

void main() {
  final logic = Logic();
  final controller = TextEditingController();

  group('test caesar cipher', () {
    testWidgets('test encryption and decryption for small characters', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      controller.text = 'abcdefghz';
      await tester.enterText(find.byType(PasswordCipher), controller.text);
      await tester.tap(find.byType(MaterialButton));
      await tester.pump();
      expect(logic.caesarCipherEncryption(controller.text), 'defghijkc');
    });

    testWidgets('test encryption and decryption for capital characters', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      controller.text = 'ABCDEFGHZ';
      await tester.enterText(find.byType(PasswordCipher), controller.text);
      await tester.tap(find.byType(MaterialButton));
      await tester.pump();
      expect(logic.caesarCipherEncryption(controller.text), 'DEFGHIJKC');
    });

    testWidgets('test encryption and decryption for numbers', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      controller.text = '123456789';
      await tester.enterText(find.byType(PasswordCipher), controller.text);
      await tester.tap(find.byType(MaterialButton));
      await tester.pump();
      expect(logic.caesarCipherEncryption(controller.text), '456789012');
    });

    testWidgets('test encryption and decryption for special characters', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      controller.text = '!@#\$%^&*()';
      await tester.enterText(find.byType(PasswordCipher), controller.text);
      await tester.tap(find.byType(MaterialButton));
      await tester.pump();
      expect(logic.caesarCipherEncryption(controller.text), '\$<&\'([)-+,');
    });
  });

  group('test vigenere cipher', () {
    testWidgets('test encryption and decryption for small characters', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      controller.text = 'abcdefghz';
      await tester.enterText(find.byType(PasswordCipher), controller.text);
      await tester.tap(find.byType(MaterialButton));
      await tester.pump();
      expect(logic.vigenereCipherEncryption(controller.text), "hjlnprtvo");
    });

    testWidgets('test encryption and decryption for capital characters', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      controller.text = 'ABCDEFGHZ';
      await tester.enterText(find.byType(PasswordCipher), controller.text);
      await tester.tap(find.byType(MaterialButton));
      await tester.pump();
      expect(logic.vigenereCipherEncryption(controller.text), 'HJLNPRTVO');
    });

    testWidgets('test encryption and decryption for numbers', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      controller.text = '123456789';
      await tester.enterText(find.byType(PasswordCipher), controller.text);
      await tester.tap(find.byType(MaterialButton));
      await tester.pump();
      expect(logic.vigenereCipherEncryption(controller.text), '680246802');
    });

    testWidgets('test encryption and decryption for special characters', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      controller.text = '!@#\$%^&*()';
      await tester.enterText(find.byType(PasswordCipher), controller.text);
      await tester.tap(find.byType(MaterialButton));
      await tester.pump();
      expect(logic.vigenereCipherEncryption(controller.text), '&>*,.\\"\'&(');
    });
  });

  group('test railFence cipher', () {
    testWidgets('test encryption and decryption for small characters', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      controller.text = 'abcdefghz';
      await tester.enterText(find.byType(PasswordCipher), controller.text);
      await tester.tap(find.byType(MaterialButton));
      await tester.pump();
      expect(logic.railFenceEncryption(controller.text,3), "aezbdfhcg");
    });

    testWidgets('test encryption and decryption for capital characters', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      controller.text = 'ABCDEFGHZ';
      await tester.enterText(find.byType(PasswordCipher), controller.text);
      await tester.tap(find.byType(MaterialButton));
      await tester.pump();
      expect(logic.railFenceEncryption(controller.text,3), 'AEZBDFHCG');
    });

    testWidgets('test encryption and decryption for numbers', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      controller.text = '123456789';
      await tester.enterText(find.byType(PasswordCipher), controller.text);
      await tester.tap(find.byType(MaterialButton));
      await tester.pump();
      expect(logic.railFenceEncryption(controller.text,3), '159246837');
    });

    testWidgets('test encryption and decryption for special characters', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      controller.text = '!@#\$%^&*()';
      await tester.enterText(find.byType(PasswordCipher), controller.text);
      await tester.tap(find.byType(MaterialButton));
      await tester.pump();
      expect(logic.railFenceEncryption(controller.text,3), '!%(@\$^*)#&');
    });
  });
}