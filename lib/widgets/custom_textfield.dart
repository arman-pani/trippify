import 'package:flutter/material.dart';
import 'package:trippify/constants/textstyle_constants.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final VoidCallback? onTap;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? suffixWidget;
  final bool readOnly;
  const CustomTextfield({
    super.key,
    required this.hintText,
    required this.labelText,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
    required this.controller,
    this.suffixWidget,
    this.prefixIcon,
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
      readOnly: readOnly,
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
