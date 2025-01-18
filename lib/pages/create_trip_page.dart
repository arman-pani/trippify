import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:trippify/utils/custom_appbar.dart';
import 'package:trippify/utils/destination_bottom_sheet.dart';
import 'package:trippify/utils/tripdate_bottom_sheet.dart';
import 'package:trippify/widgets/custom_gradient_button.dart';
import 'package:trippify/widgets/custom_textfield.dart';

class CreateTripPage extends StatefulWidget {
  const CreateTripPage({super.key});

  @override
  State<CreateTripPage> createState() => _CreateTripPageState();
}

class _CreateTripPageState extends State<CreateTripPage> {
  final destinationController = TextEditingController();
  final dateController = TextEditingController();
  final descriptionController = TextEditingController();
  final budgetController = TextEditingController();
  final peopleController = TextEditingController();

  int _peopleCount = 1;

  void _incrementCount() {
    setState(() {
      _peopleCount++;
      peopleController.text = _peopleCount.toString();
    });
  }

  void _decrementCount() {
    if (_peopleCount > 1) {
      // Prevent negative counts
      setState(() {
        _peopleCount--;
        peopleController.text = _peopleCount.toString();
      });
    }
  }

  Widget _peopleCounter() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: _incrementCount,
          child: Icon(
            Icons.keyboard_arrow_up,
            color: Colors.black,
            size: 20,
          ),
        ),
        GestureDetector(
          onTap: _decrementCount,
          child: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
            size: 20,
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    peopleController.text = _peopleCount.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: 'Create Trip'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            spacing: 20,
            children: [
              CustomTextfield(
                controller: destinationController,
                onTap: () => showDestinationModal(
                  context,
                  descriptionController,
                ),
                hintText: 'Select your destination',
                labelText: 'Trip Destination',
                readOnly: true,
                suffixIcon: Symbols.arrow_drop_down_rounded,
              ),
              CustomTextfield(
                controller: dateController,
                onTap: () => showTripDateModal(context, dateController),
                hintText: 'Select date',
                labelText: 'Trip Date',
                readOnly: true,
                suffixIcon: Symbols.arrow_drop_down_rounded,
              ),
              Row(
                children: [
                  Flexible(
                    child: CustomTextfield(
                      controller: budgetController,
                      hintText: '\$100',
                      labelText: 'Your budget',
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: CustomTextfield(
                      controller: peopleController,
                      hintText: '',
                      readOnly: true,
                      labelText: 'People',
                      suffixWidget: _peopleCounter(),
                    ),
                  ),
                ],
              ),
              CustomTextfield(
                controller: descriptionController,
                hintText: 'Enter trip description (optional)',
                labelText: 'Description',
              ),
              CustomGradientButton(
                label: 'Create Trip',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
