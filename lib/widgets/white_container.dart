import 'package:flutter/material.dart';
import 'package:trippify/constants/textstyle_constants.dart';
import 'package:trippify/constants/theme_constants.dart';

class WhiteContainer extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  const WhiteContainer({super.key, this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: shadowList,
        color: Colors.white,
      ),
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Text(
              title!,
              style: TextstyleConstants.titleTextStyle,
            ),
          ...children,
        ],
      ),
    );
  }
}
