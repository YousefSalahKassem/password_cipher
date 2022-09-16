import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:password_cipher/src/logic.dart';
import 'package:password_cipher/password_cipher.dart';
import 'package:password_cipher/src/password_field.dart';

void main() {
  final logic = Logic();
  final controller = TextEditingController();

  testWidgets('test encryption and decryption for small characters', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    controller.text = 'abcdefghz';
    await tester.enterText(find.byType(PasswordField), controller.text);
    await tester.tap(find.byType(MaterialButton));
    await tester.pump();
    expect(logic.caesarCipherEncryption(controller.text), 'defghijkc');
  });

  testWidgets('test encryption and decryption for capital characters', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    controller.text = 'ABCDEFGHZ';
    await tester.enterText(find.byType(PasswordField), controller.text);
    await tester.tap(find.byType(MaterialButton));
    await tester.pump();
    expect(logic.caesarCipherEncryption(controller.text), 'DEFGHIJKC');
  });

  testWidgets('test encryption and decryption for numbers', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    controller.text = '123456789';
    await tester.enterText(find.byType(PasswordField), controller.text);
    await tester.tap(find.byType(MaterialButton));
    await tester.pump();
    expect(logic.caesarCipherEncryption(controller.text), '456789012');
  });

  testWidgets('test encryption and decryption for special characters', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    controller.text = '!@#\$%^&*()';
    await tester.enterText(find.byType(PasswordField), controller.text);
    await tester.tap(find.byType(MaterialButton));
    await tester.pump();
    expect(logic.caesarCipherEncryption(controller.text), '\$<&\'([)-+,');
  });
}

