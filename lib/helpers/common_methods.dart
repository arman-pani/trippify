import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  final DateFormat formatter = DateFormat('d MMM yyyy');
  return formatter.format(date);
}

String extractTimeFromDateTime(DateTime dateTime) {
  final DateFormat formatter = DateFormat('h:mm a');
  return formatter.format(dateTime);
}

String formatTimeOfDay(TimeOfDay timeOfDay) {
  final hour = timeOfDay.hourOfPeriod == 0 ? 12 : timeOfDay.hourOfPeriod;
  final minute = timeOfDay.minute.toString().padLeft(2, '0');
  final period = timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';

  return '$hour:$minute $period';
}

String convertDateString(String dateString) {
  try {
    debugPrint('Parsing date string: $dateString'); // Debugging line

    final DateFormat inputFormat = DateFormat('dd-MM-yyyy');
    final DateTime parsedDate = inputFormat.parse(dateString);
    final DateFormat formatter = DateFormat('d MMM yyyy');
    return formatter.format(parsedDate);
  } catch (e) {
    throw FormatException('Invalid date format. Expected format: YYYY-MM-DD');
  }
}

bool isEmailValid(String email) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  return regex.hasMatch(email);
}
