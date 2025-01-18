import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  final DateFormat formatter = DateFormat('d MMM yyyy');
  return formatter.format(date);
}

String formatTimeOfDay(TimeOfDay timeOfDay) {
  final hour = timeOfDay.hourOfPeriod == 0 ? 12 : timeOfDay.hourOfPeriod;
  final minute = timeOfDay.minute.toString().padLeft(2, '0');
  final period = timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';

  return '$hour:$minute $period';
}
