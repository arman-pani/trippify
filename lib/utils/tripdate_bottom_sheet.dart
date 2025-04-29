import 'package:flutter/material.dart';
import 'package:trippify/widgets/custom_calender.dart';

Future<void> showTripDateModal(
  BuildContext context,
  TextEditingController startDateController,
  TextEditingController endDateController,
) async {
  await showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: CustomCalendar(
          startDateController: startDateController,
          endDateController: endDateController,
        ),
      );
    },
  );
}
