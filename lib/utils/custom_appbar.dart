import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:trippify/constants/textstyle_constants.dart';

AppBar commonAppBar(
    {required String title,
    required BuildContext context,
    PreferredSizeWidget? bottom}) {
  return AppBar(
    titleSpacing: 0,
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Icon(
        Symbols.arrow_back_rounded,
        weight: 600,
      ),
    ),
    title: Text(
      title,
      style: TextstyleConstants.appBarTitle,
    ),
    bottom: bottom,
  );
}

AppBar indexAppBar({required String title, required IconData icon}) {
  return AppBar(
    shadowColor: Colors.grey.shade100,
    backgroundColor: Colors.grey.shade100,
    leading: Icon(
      icon,
      color: Colors.black,
      size: 35,
    ),
    title: Text(
      title,
      style: TextstyleConstants.appBarTitle,
    ),
    titleSpacing: 0,
  );
}
