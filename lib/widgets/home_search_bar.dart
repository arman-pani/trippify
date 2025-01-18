import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:trippify/constants/textstyle_constants.dart';
import 'package:trippify/constants/theme_constants.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: shadowList,
      ),
      child: Row(
        children: [
          Icon(
            Symbols.search,
            size: 24,
            color: Colors.blue,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Where to?",
                style: TextstyleConstants.smallTextStyle1.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Anywhere . Anytime . On budget",
                style: TextstyleConstants.smallTextStyle1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
