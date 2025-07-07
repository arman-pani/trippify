import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trippify/constants/theme_constants.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final TextInputType? keyboardType;
  final int maxlines;
  final VoidCallback? onTap;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? suffixWidget;
  final bool readOnly;
  final bool isObscure;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextfield({
    super.key,
    required this.hintText,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.maxlines = 1,
    this.isObscure = false,
    this.readOnly = false,
    this.onTap,
    required this.controller,
    this.suffixWidget,
    this.prefixIcon,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      obscureText: isObscure,
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly,
      maxLines: maxlines,
      inputFormatters: inputFormatters,
      decoration: inputDecoration.copyWith(
        prefixIcon: prefixIcon == null
            ? null
            : Icon(
                prefixIcon,
                color: Colors.grey.shade900,
                size: 24,
              ),
        suffix: suffixWidget,
        suffixIcon: suffixIcon == null
            ? null
            : Icon(
                suffixIcon,
                color: Colors.grey.shade900,
                size: 24,
              ),
        hintText: hintText,
        labelText: labelText,
      ),
    );
  }
}

class DollarInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;
    if (!newText.startsWith('\$')) {
      newText = '\$${newText.replaceAll('\$', '')}';
    }
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
