import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:trippify/bloc/trip/trip_bloc.dart';
import 'package:trippify/models/user_request_trip.dart';
import 'package:trippify/utils/custom_appbar.dart';
import 'package:trippify/utils/destination_bottom_sheet.dart';
import 'package:trippify/utils/snack_bar.dart';
import 'package:trippify/utils/tripdate_bottom_sheet.dart';
import 'package:trippify/widgets/custom_gradient_button.dart';
import 'package:trippify/widgets/custom_icon_button.dart';
import 'package:trippify/widgets/custom_textfield.dart';

class CreateTripPage extends StatefulWidget {
  const CreateTripPage({super.key});

  @override
  State<CreateTripPage> createState() => _CreateTripPageState();
}

class _CreateTripPageState extends State<CreateTripPage> {
  final destinationController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final finalDateController = TextEditingController();
  final descriptionController = TextEditingController();
  final budgetController = TextEditingController();
  final peopleController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  int _peopleCount = 1;

  void _onCreateTrip(BuildContext context) {
    final UserRequestTrip userRequestTrip = UserRequestTrip(
      homeCity: "BBS",
      destination: "LTT",
      startDate: startDateController.text.split('-').reversed.join('-'),
      endDate: endDateController.text.split('-').reversed.join('-'),
      budget: int.parse(budgetController.text.replaceFirst("\$", "")),
      people: int.parse(peopleController.text),
      description: descriptionController.text,
    );
    context.read<TripBloc>().add(TripRequested(userRequestTrip));
  }

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
      appBar: commonAppBar(title: 'Create Trip', context: context),
      body: BlocConsumer<TripBloc, TripState>(
        listener: (context, state) {
          if (state is TripError) {
            SnackBarUtils.showSnackBar(
              context,
              state.message,
              backgroundColor: Colors.red,
            );
          }
          if (state is TripLoaded) {
            // Navigator.push(
            //     context, AppRouter.tripItineraryPage(state.aiGeneratedTrip));
          }
        },
        builder: (context, state) {
          if (state is TripLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Column(
                spacing: 20,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: _selectedImage != null
                              ? DecorationImage(
                                  image: FileImage(File(_selectedImage!.path)),
                                  fit: BoxFit.cover,
                                )
                              : DecorationImage(
                                  image: AssetImage(
                                      'assets/images/home_bg_image.png'),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: CustomIconButton(
                          icon: Symbols.image_rounded,
                          onPressed: _pickImage,
                        ),
                      ),
                    ],
                  ),
                  CustomTextfield(
                    controller: destinationController,
                    onTap: () => showDestinationModal(
                      context,
                      destinationController,
                    ),
                    hintText: 'Select your destination',
                    labelText: 'Trip Destination',
                    readOnly: true,
                    suffixIcon: Symbols.arrow_drop_down_rounded,
                  ),
                  CustomTextfield(
                    controller: finalDateController,
                    onTap: () async {
                      await showTripDateModal(
                        context,
                        startDateController,
                        endDateController,
                      );
                      finalDateController.text =
                          '${startDateController.text} - ${endDateController.text}';
                    },
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
                          keyboardType: TextInputType.number,
                          inputFormatters: [DollarInputFormatter()],
                          hintText: '\$\$',
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
                    onPressed: () => _onCreateTrip(context),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
