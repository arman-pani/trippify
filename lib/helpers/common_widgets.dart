import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:trippify/constants/colors_constants.dart';
import 'package:trippify/constants/textstyle_constants.dart';

class CustomRichText extends StatefulWidget {
  final String text;
  final String linkText;
  final VoidCallback onLinkTap;

  const CustomRichText({
    super.key,
    required this.text,
    required this.linkText,
    required this.onLinkTap,
  });

  @override
  CustomRichTextState createState() => CustomRichTextState();
}

class CustomRichTextState extends State<CustomRichText> {
  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = widget.onLinkTap;
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextstyleConstants.mediumTextStyle1,
        children: [
          TextSpan(text: widget.text),
          TextSpan(
            text: widget.linkText,
            style: TextstyleConstants.mediumTextStyle1.copyWith(
              color: Colors.blue,
            ),
            recognizer: _tapGestureRecognizer,
          ),
        ],
      ),
    );
  }
}

Widget termsCheckbox() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      StatefulBuilder(
        builder: (context, setState) {
          bool isChecked = false;
          return Checkbox(
            visualDensity: VisualDensity.standard,
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value ?? false;
              });
            },
          );
        },
      ),
      Expanded(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: CustomRichText(
            text: "By registering to this, you are accepting our ",
            linkText: "Terms and Conditions",
            onLinkTap: () {}),
      )),
    ],
  );
}

void showErrorSnackBar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: ColorsConstants.lightBlueColor,
    ),
  );
}
