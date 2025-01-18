import 'package:flutter/material.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:trippify/constants/textstyle_constants.dart';
import 'package:trippify/widgets/custom_calender.dart';
import 'package:trippify/widgets/custom_gradient_button.dart';

void showTripDateModal(
  BuildContext context,
  TextEditingController dateController,
) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      final calendarController = CleanCalendarController(
        minDate: DateTime.now(),
        maxDate: DateTime(2030),
      );
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 15,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton.filled(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                  ),
                  color: Colors.black,
                ),
                Spacer(flex: 1),
                Text(
                  'Trip Dates',
                  style: TextstyleConstants.titleTextStyle,
                ),
                Spacer(flex: 2),
              ],
            ),
            CustomCalendar(),
            CustomGradientButton(
              label: 'Confirm',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
