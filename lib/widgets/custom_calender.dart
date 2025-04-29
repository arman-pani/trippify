import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:trippify/constants/textstyle_constants.dart';
import 'package:trippify/widgets/custom_gradient_button.dart';

class CustomCalendar extends StatefulWidget {
  final TextEditingController startDateController;
  final TextEditingController endDateController;
  const CustomCalendar({
    super.key,
    required this.startDateController,
    required this.endDateController,
  });

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;

  void _onConfirm() {
    setState(() {
      widget.startDateController.text = _rangeStart != null
          ? DateFormat('yyyy-MM-dd').format(_rangeStart!)
          : '';
      widget.endDateController.text =
          _rangeEnd != null ? DateFormat('yyyy-MM-dd').format(_rangeEnd!) : '';
    });

    debugPrint('Start Date Controller: ${widget.startDateController.text}');
    debugPrint('End Date Controller: ${widget.endDateController.text}');

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 15,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton.filled(
              onPressed: _onConfirm,
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
        Column(
          children: [
            TableCalendar(
              firstDay: DateTime.now(),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              rangeStartDay: _rangeStart,
              rangeEndDay: _rangeEnd,
              rangeSelectionMode: _rangeSelectionMode,
              calendarStyle: CalendarStyle(
                isTodayHighlighted: false,
                selectedDecoration: BoxDecoration(
                  color: Colors.blue.shade700,
                  shape: BoxShape.circle,
                ),
                rangeHighlightColor: Colors.blue.shade100,
                rangeStartDecoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                rangeEndDecoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                outsideDaysVisible: false,
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              onRangeSelected: (start, end, focusedDay) {
                setState(
                  () {
                    _rangeStart = start;
                    _rangeEnd = end;
                    debugPrint('Start: $start, End: $end');

                    _focusedDay = focusedDay;
                    _rangeSelectionMode = RangeSelectionMode.toggledOn;
                  },
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                timeContainer("From", _rangeStart),
                SizedBox(width: 15),
                timeContainer("To", _rangeEnd),
              ],
            )
          ],
        ),
        CustomGradientButton(
          label: 'Confirm',
          onPressed: _onConfirm,
        ),
      ],
    );
  }

  Widget timeContainer(String title, DateTime? date) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 16.0,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextstyleConstants.smallTextStyle1,
            ),
            Text(
              date != null ? formatDate(date) : 'Select',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatDate(DateTime? date) =>
      date != null ? DateFormat('EEE, d MMM').format(date) : 'Select';
}
