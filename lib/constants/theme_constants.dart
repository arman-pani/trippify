import 'package:flutter/material.dart';
import 'package:trippify/constants/textstyle_constants.dart';

List<BoxShadow> shadowList = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 3,
    blurRadius: 10,
    offset: const Offset(0, 5),
  ),
  BoxShadow(
    color: Colors.grey.withOpacity(0.1),
    spreadRadius: -2,
    blurRadius: 4,
    offset: const Offset(0, 2),
  ),
];

OutlineInputBorder borderDecoration = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    width: 1,
    color: Colors.black,
  ),
);

InputDecoration inputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.all(15),
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
  hintStyle: TextstyleConstants.hintTextStyle,
  floatingLabelBehavior: FloatingLabelBehavior.always,
  labelStyle: TextstyleConstants.labelTextStyle,
);
