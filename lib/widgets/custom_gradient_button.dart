import 'package:flutter/material.dart';
import 'package:trippify/constants/textstyle_constants.dart';

class CustomGradientButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const CustomGradientButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(
        label,
        style: TextstyleConstants.buttonTextStyle,
      ),
    );
  }
}
