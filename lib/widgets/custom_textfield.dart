import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trippify/constants/textstyle_constants.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? suffixWidget;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextfield({
    super.key,
    required this.hintText,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
    required this.controller,
    this.suffixWidget,
    this.prefixIcon,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder borderDecoration = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        width: 1,
        color: Colors.black,
      ),
    );
    return TextField(
      onTap: onTap,
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        constraints: BoxConstraints(
          maxHeight: 50,
          maxWidth: double.infinity,
          minHeight: 50,
          minWidth: 0,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        border: borderDecoration,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1.2,
            color: Colors.black,
          ),
        ),
        focusedBorder: borderDecoration,
        errorBorder: borderDecoration,
        disabledBorder: borderDecoration,
        focusedErrorBorder: borderDecoration,
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
        hintStyle: TextstyleConstants.hintTextStyle,
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextstyleConstants.labelTextStyle,
      ),
    );
  }
}

class DollarInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Ensure the dollar sign is always at the start
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
