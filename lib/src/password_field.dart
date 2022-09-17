import 'package:flutter/material.dart';
import 'logic.dart';


class PasswordCipher extends StatefulWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final bool? enabled;
  final bool? isRequired;
  final String? label;
  final String? initialValue;
  final TextAlign align;
  final ValueChanged<String>? onSubmitted;
  final Widget? prefix;
  final Widget? prefixIcon;
  final String? prefixText;
  final Widget? suffix;
  final String? suffixText;
  final String? hint;
  final String? errorKey;
  final String? description;
  final bool? expands;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final double suffixIconWidth;
  final FocusScopeNode? focusNode;
  final Color? fillColor;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final BoxConstraints? suffixIconConstraints;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final Color? passwordIconColor;
  final Color? encryptIconColor;
  final double? passwordIconSize;
  final double? encryptIconSize;

  const PasswordCipher({
    Key? key,
    this.controller,
    this.validator,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onChanged,
    this.onSaved,
    this.enabled,
    this.isRequired,
    this.initialValue,
    this.align = TextAlign.start,
    this.label,
    this.onSubmitted,
    this.prefix,
    this.prefixIcon,
    this.prefixText,
    this.suffix,
    this.suffixText,
    this.hint,
    this.description,
    this.errorKey,
    this.expands,
    this.keyboardType,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.focusNode,
    this.fillColor,
    this.suffixIconWidth = 50,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.suffixIconConstraints,
    this.style,
    this.hintStyle,
    this.passwordIconColor,
    this.encryptIconColor,
    this.passwordIconSize,
    this.encryptIconSize,
  }) : super(key: key);

  @override
  State<PasswordCipher> createState() => _PasswordCipherState();
}

class _PasswordCipherState extends State<PasswordCipher> {
  late bool focused = false;
  late bool passwordVisible;
  late bool isEncrypted;

  @override
  void initState() {
    passwordVisible = true;
    isEncrypted = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      style: widget.style,
      decoration: InputDecoration(
        hintStyle: widget.hintStyle,
        labelText: widget.label,
        hintText: widget.hint,
        errorText: widget.errorKey,
        prefix: widget.prefix,
        prefixIcon: IconButton(
          onPressed: () {
            setState(() {
              isEncrypted = !isEncrypted;
              if (isEncrypted) {
                widget.controller!.text = Logic().caesarCipherDecryption(widget.controller!.text,);
              } else {
                widget.controller!.text = Logic().caesarCipherEncryption(widget.controller!.text);
              }
            });
          },
          icon: Icon(isEncrypted
              ? Icons.lock_outline_rounded
              : Icons.lock_open_rounded),
          color: widget.encryptIconColor,
          iconSize: widget.encryptIconSize,
        ),
        prefixText: widget.prefixText,
        suffix: widget.suffix,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              passwordVisible = !passwordVisible;
            });
          },
          icon: Icon(passwordVisible ? Icons.visibility_off : Icons.visibility),
          color: widget.passwordIconColor,
          iconSize: widget.encryptIconSize,
        ),
        suffixText: widget.suffixText,
        suffixIconConstraints: widget.suffixIconConstraints,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        border: widget.border,
        focusedBorder: widget.focusedBorder,
        enabledBorder: widget.enabledBorder,
        errorBorder: widget.errorBorder,
        focusedErrorBorder: widget.focusedErrorBorder,
      ),
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      enabled: widget.enabled,
      textAlign: widget.align,
      obscureText: passwordVisible,
      expands: widget.expands ?? false,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      focusNode: widget.focusNode,
    );
  }
}
