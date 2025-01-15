import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:trippify/constants/textstyle_constants.dart';

AppBar commonAppBar(String title) {
  return AppBar(
    leading: IconButton(
      onPressed: () {},
      icon: Icon(
        Symbols.arrow_back_ios_new_rounded,
        color: Colors.black,
        size: 24,
      ),
    ),
    title: Text(
      title,
      style: TextstyleConstants.appBarTitle,
    ),
  );
}
