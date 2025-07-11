import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trippify/bloc/auth/auth_bloc.dart';
import 'package:trippify/constants/app_constants.dart';
import 'package:trippify/constants/colors_constants.dart';
import 'package:trippify/constants/string_constants.dart';
import 'package:trippify/constants/textstyle_constants.dart';
import 'package:trippify/helpers/common_widgets.dart';
import 'package:trippify/models/user_model.dart';
import 'package:trippify/utils/app_router.dart';
import 'package:trippify/utils/enum_classes.dart';
import 'package:trippify/utils/shared_prefs_methods.dart';
import 'package:trippify/widgets/custom_gradient_button.dart';
import 'package:trippify/widgets/custom_textfield.dart';
import 'package:trippify/widgets/dropdown_textfield.dart';
import 'package:trippify/widgets/mutli_select_preferences.dart';

class ProfileCreationPage extends StatefulWidget {
  const ProfileCreationPage({super.key});

  @override
  State<ProfileCreationPage> createState() => _ProfileCreationPageState();
}

class _ProfileCreationPageState extends State<ProfileCreationPage> {
  int _currentIndex = 0;

  List<String> preferredPlaces = [];
  List<String> preferredActivities = [];

  TextEditingController usernameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  Enum selectedAgeRange = AgeRange.group18To24;
  Enum selectedGender = Gender.male;
  Enum selectedTravellerType = TravellerType.solo;

  void onContinuePressed() {
    switch (_currentIndex) {
      case 0:
        if (usernameController.text.trim().isEmpty) {
          return showErrorSnackBar('Please enter username.', context);
        }
        break;
      case 1:
        if (preferredPlaces.isEmpty) {
          return showErrorSnackBar('Please atleast one item.', context);
        }
        break;
      case 2:
        onCreateProfilePressed();
        return;
    }

    if (_currentIndex != 2) {
      setState(() {
        _currentIndex++;
      });
    }
  }

  void onCreateProfilePressed() async {
    if (preferredActivities.isEmpty) {
      return showErrorSnackBar('Please atleast one item.', context);
    }
    UserModel user = UserModel(
      id: await SharedPrefsMethods.getUserId(),
      username: usernameController.text.trim(),
      age: selectedAgeRange as AgeRange,
      travellerType: selectedTravellerType as TravellerType,
      gender: selectedGender as Gender,
      creationDateTime: DateTime.now(),
      prefferedPlaces: preferredPlaces,
      prefferedActivities: preferredActivities,
    );

    context.read<AuthBloc>().add(CreateProfile(user));
  }

  onAgeRangeChanged(Enum? newValue) {
    if (newValue != null) {
      setState(() {
        selectedAgeRange = newValue;
      });
    }
  }

  onGenderChanged(Enum? newValue) {
    if (newValue != null) {
      setState(() {
        selectedGender = newValue;
      });
    }
  }

  onTravellerTypeChanged(Enum? newValue) {
    if (newValue != null) {
      setState(() {
        selectedTravellerType = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("CURRENT INDEX: $_currentIndex");

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (_currentIndex != 0) {
              setState(() {
                _currentIndex--;
              });
            } else {
              Navigator.pop(context);
            }
          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
        title: LinearProgressIndicator(
          color: ColorsConstants.blueColor,
          backgroundColor: ColorsConstants.lightBlueColor,
          value: 0.30 * (_currentIndex + 1),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              context.pushReplacementNamed(AppRouterConstants.homePage);
              showErrorSnackBar(state.message, context);
            }

            if (state is AuthFailure) {
              showErrorSnackBar(state.error, context);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(child: CircularProgressIndicator());
            }
            Widget stepWidget;
            if (_currentIndex == 0) {
              stepWidget = basicInfoTab();
            } else if (_currentIndex == 1) {
              stepWidget = MutliSelectPreferences(
                key: ValueKey("places"),
                items: places,
                selectedItems: preferredPlaces,
                onChange: (selectedItems) {
                  preferredPlaces.clear();
                  preferredPlaces.addAll(selectedItems);
                  debugPrint(preferredPlaces.toString());
                },
              );
            } else if (_currentIndex == 2) {
              stepWidget = MutliSelectPreferences(
                key: ValueKey("activities"),
                selectedItems: preferredActivities,
                items: activities,
                onChange: (selectedItems) {
                  preferredActivities.clear();
                  preferredActivities.addAll(selectedItems);
                  debugPrint(preferredActivities.toString());
                },
              );
            } else {
              stepWidget = SizedBox.shrink();
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.profileCreationTitles[_currentIndex],
                    style: TextstyleConstants.titleTextStyle,
                  ),
                  if (_currentIndex != 0)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(),
                        Text(
                          'Choose upto 8 categories',
                          style: TextstyleConstants.subTitleTextStyle
                              .copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  stepWidget,
                  CustomGradientButton(
                    label: 'Continue',
                    onPressed: onContinuePressed,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget basicInfoTab() {
    return Column(
      spacing: 20,
      children: [
        CircleAvatar(
          radius: 70,
          backgroundColor: Colors.blueGrey,
        ),
        CustomTextfield(
          hintText: 'Enter username',
          labelText: 'Username*',
          controller: usernameController,
        ),
        Row(
          children: [
            Expanded(
              child: DropdownTextfield(
                hintText: 'Enter your age',
                labelText: 'Age Range',
                dropDownList: AgeRange.values,
                onChanged: onAgeRangeChanged,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: DropdownTextfield(
                hintText: 'Enter your gender',
                labelText: 'Gender',
                dropDownList: Gender.values,
                onChanged: onGenderChanged,
              ),
            ),
          ],
        ),
        DropdownTextfield(
          hintText: 'What type of traveller are you?',
          labelText: 'What type of traveller are you?',
          dropDownList: TravellerType.values,
          onChanged: onTravellerTypeChanged,
        ),
        CustomTextfield(
          hintText: 'Tell the world about yourself!',
          labelText: 'Bio',
          maxlines: 5,
          controller: bioController,
        ),
      ],
    );
  }
}
