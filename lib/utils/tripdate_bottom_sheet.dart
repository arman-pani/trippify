import 'package:flutter/material.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:trippify/constants/textstyle_constants.dart';
import 'package:trippify/widgets/custom_calender.dart';

void showTripDateModal(
  BuildContext context,
  TextEditingController dateController,
) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      final calendarController = CleanCalendarController(
        minDate: DateTime.now(),
        maxDate: DateTime(2030),
      );
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Travel Destination',
              style: TextstyleConstants.titleTextStyle,
            ),
          ),
          CustomCalendar(),
        ],
      );
    },
  );
}
