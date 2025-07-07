import 'package:flutter/material.dart';
import 'package:trippify/constants/theme_constants.dart';

class DropdownTextfield extends StatelessWidget {
  final String hintText;
  final String labelText;
  final List<Enum> dropDownList;
  final Function(Enum?) onChanged;
  const DropdownTextfield(
      {super.key,
      required this.onChanged,
      required this.hintText,
      required this.labelText,
      required this.dropDownList});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      items: dropDownList.map((Enum dropDownItem) {
        return DropdownMenuItem(
          value: dropDownItem,
          child: Text(dropDownItem.toString()),
        );
      }).toList(),
      initialValue: dropDownList[0],
      onChanged: onChanged,
      decoration: inputDecoration.copyWith(
        hintText: hintText,
        labelText: labelText,
      ),
    );
  }
}
