import 'package:flutter/material.dart';
import 'package:trippify/constants/colors_constants.dart';
import 'package:trippify/constants/textstyle_constants.dart';
import 'package:trippify/helpers/common_widgets.dart';

class MultiSelectModel {
  final String label;
  final String value;

  MultiSelectModel({
    required this.label,
    required this.value,
  });
}

class MutliSelectPreferences extends StatefulWidget {
  final List<MultiSelectModel> items;
  final List<String> selectedItems;
  final void Function(List<String>) onChange;
  const MutliSelectPreferences({
    super.key,
    required this.items,
    required this.selectedItems,
    required this.onChange,
  });

  @override
  State<MutliSelectPreferences> createState() => _MutliSelectPreferencesState();
}

class _MutliSelectPreferencesState extends State<MutliSelectPreferences> {
  late List<String> selectedItems;

  @override
  void initState() {
    super.initState();
    selectedItems = List<String>.from(widget.selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: widget.items.map((item) {
        final isSelected = selectedItems.contains(item.value);
        return GestureDetector(
          onTap: () {
            setState(() {
              isSelected
                  ? selectedItems.remove(item.value)
                  : selectedItems.length == 8
                      ? showErrorSnackBar(
                          'You can choose upto 8 categoires.', context)
                      : selectedItems.add(item.value);
            });
            widget.onChange(selectedItems);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isSelected ? ColorsConstants.blueColor : Colors.white,
              border: Border.all(color: Colors.grey, width: 0.5),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.label,
                  style: TextstyleConstants.smallTextStyle3.copyWith(
                      color: isSelected ? Colors.white : Colors.black),
                ),
                if (isSelected)
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Icon(
                      Icons.remove_circle_outline_rounded,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
