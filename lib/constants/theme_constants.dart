import 'package:flutter/material.dart';

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
