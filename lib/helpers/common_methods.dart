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
    final DateTime parsedDate = DateTime.parse(dateString);
    final DateFormat formatter = DateFormat('d MMM yyyy');
    return formatter.format(parsedDate);
  } catch (e) {
    throw FormatException('Invalid date format. Expected format: YYYY-MM-DD');
  }
}
