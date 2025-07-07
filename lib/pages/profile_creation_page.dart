import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:go_router/go_router.dart';
import 'package:trippify/bloc/auth/auth_bloc.dart';
import 'package:trippify/constants/colors_constants.dart';
import 'package:trippify/constants/textstyle_constants.dart';
import 'package:trippify/helpers/common_widgets.dart';
import 'package:trippify/models/user_model.dart';
import 'package:trippify/utils/app_router.dart';
import 'package:trippify/utils/enum_classes.dart';
import 'package:trippify/utils/shared_prefs_methods.dart';
import 'package:trippify/widgets/custom_gradient_button.dart';
import 'package:trippify/widgets/custom_textfield.dart';
import 'package:trippify/widgets/dropdown_textfield.dart';

class ProfileCreationPage extends StatefulWidget {
  const ProfileCreationPage({super.key});

  @override
  State<ProfileCreationPage> createState() => _ProfileCreationPageState();
}

class _ProfileCreationPageState extends State<ProfileCreationPage> {
  int _currentIndex = 0;

  MultiSelectController placesController = MultiSelectController();
  MultiSelectController activitiesController = MultiSelectController();

  TextEditingController usernameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  Enum selectedAgeRange = AgeRange.group18To24;
  Enum selectedGender = Gender.male;
  Enum selectedTravellerType = TravellerType.solo;

  void onBasicInfoContinue() {
    if (usernameController.text.trim().isEmpty) {
      return showErrorSnackBar('Please enter username.', context);
    }

    setState(() {
      _currentIndex++;
    });
  }

  void onPlacesInfoContinue() {
    if (placesController.getSelectedItems().isEmpty) {
      return showErrorSnackBar('Please atleast one item.', context);
    }
    setState(() {
      _currentIndex++;
    });
  }

  void onContinuePressed() {
    switch (_currentIndex) {
      case 0:
        onBasicInfoContinue();
      case 1:
        onPlacesInfoContinue();
      case 2:
        onCreateProfilePressed();
    }
  }

  void onCreateProfilePressed() async {
    if (activitiesController.getSelectedItems().isEmpty) {
      return showErrorSnackBar('Please atleast one item.', context);
    }
    UserModel user = UserModel(
      id: await SharedPrefsMethods.getUserId(),
      username: usernameController.text.trim(),
      age: selectedAgeRange as AgeRange,
      travellerType: selectedTravellerType as TravellerType,
      gender: selectedGender as Gender,
      creationDateTime: DateTime.now(),
      prefferedPlaces: placesController.getSelectedItems() as List<String>,
      prefferedActivities:
          activitiesController.getSelectedItems() as List<String>,
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

  final List<String> titles = [
    'Customize your profile',
    'What type of places you want to visit ?',
    'What activities are you interested in ?'
  ];

  final List<Widget> tabWidgets = [];

  @override
  void initState() {
    super.initState();

    tabWidgets = [
      basicInfoTab(),
      MutliSelectPreferences(
        items: places,
        selectController: placesController,
      ),
      MutliSelectPreferences(
        items: activities,
        selectController: activitiesController,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
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
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titles[_currentIndex],
                    style: TextstyleConstants.titleTextStyle,
                  ),
                  if (_currentIndex != 0)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(),
                        Text(
                          'Choose upto 8 categories',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  tabWidgets[_currentIndex],
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

class MutliSelectPreferences extends StatelessWidget {
  final List<MultiSelectCard> items;
  final MultiSelectController selectController;
  MutliSelectPreferences(
      {super.key, required this.items, required this.selectController});

  final BoxDecoration boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
    border: Border.all(color: Colors.grey, width: 0.5),
  );

  final TextStyle textStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  @override
  Widget build(BuildContext context) {
    return MultiSelectContainer(
      controller: selectController,
      itemsPadding: EdgeInsets.all(10),
      suffix: MultiSelectSuffix(
        selectedSuffix: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Icon(
            Icons.remove_circle_outline_rounded,
            color: Colors.white,
            size: 14,
          ),
        ),
      ),
      textStyles: MultiSelectTextStyles(
        textStyle: textStyle,
        selectedTextStyle: textStyle.copyWith(color: Colors.white),
      ),
      itemsDecoration: MultiSelectDecorations(
        decoration: boxDecoration,
        selectedDecoration:
            boxDecoration.copyWith(color: ColorsConstants.blueColor),
      ),
      items: items,
      maxSelectableCount: 8,
      onMaximumSelected: (selectedItems, selectedItem) {
        showErrorSnackBar('You can choose only 8 categories only.', context);
      },
      onChange: (allSelectedItems, selectedItem) {},
    );
  }
}

List<MultiSelectCard> places = [
  MultiSelectCard(value: 'Mountains', label: '⛰️ Mountains'),
  MultiSelectCard(value: 'Beaches', label: '🏖️ Beaches'),
  MultiSelectCard(value: 'Forests', label: '🌲 Forests'),
  MultiSelectCard(value: 'Deserts', label: '🏜️ Deserts'),
  MultiSelectCard(value: 'Lakes & Rivers', label: '🌊 Lakes & Rivers'),
  MultiSelectCard(value: 'Islands', label: '🏝️ Islands'),
  MultiSelectCard(value: 'National Parks', label: '🏞️ National Parks'),
  MultiSelectCard(value: 'Hill Stations', label: '🌄 Hill Stations'),
  MultiSelectCard(value: 'Historical Places', label: '🏛️ Historical Places'),
  MultiSelectCard(value: 'Spiritual Sites', label: '🛕 Spiritual Sites'),
  MultiSelectCard(
      value: 'Temples & Monasteries', label: '⛩️ Temples & Monasteries'),
  MultiSelectCard(value: 'Forts & Palaces', label: '🏰 Forts & Palaces'),
  MultiSelectCard(value: 'Modern Cities', label: '🌆 Modern Cities'),
  MultiSelectCard(value: 'Countryside', label: '🌾 Countryside'),
  MultiSelectCard(
      value: 'Wildlife Sanctuaries', label: '🐘 Wildlife Sanctuaries'),
  MultiSelectCard(value: 'Coastal Areas', label: '🌅 Coastal Areas'),
  MultiSelectCard(value: 'Scenic Villages', label: '🏡 Scenic Villages'),
  MultiSelectCard(
      value: 'Cultural Heritage Sites', label: '🕌 Cultural Heritage Sites')
];

List<MultiSelectCard> activities = [
  MultiSelectCard(value: 'Trekking', label: '🥾 Trekking'),
  MultiSelectCard(value: 'Camping', label: '⛺ Camping'),
  MultiSelectCard(value: 'Road Trips', label: '🚗 Road Trips'),
  MultiSelectCard(value: 'Wildlife Safari', label: '🦁 Wildlife Safari'),
  MultiSelectCard(value: 'Nature Walks', label: '🌳 Nature Walks'),
  MultiSelectCard(value: 'Beach Relaxation', label: '🏖️ Beach Relaxation'),
  MultiSelectCard(value: 'Water Sports', label: '🌊 Water Sports'),
  MultiSelectCard(value: 'Scuba Diving', label: '🤿 Scuba Diving'),
  MultiSelectCard(value: 'Boating', label: '🛶 Boating'),
  MultiSelectCard(value: 'Skiing', label: '🎿 Skiing'),
  MultiSelectCard(value: 'Paragliding', label: '🪂 Paragliding'),
  MultiSelectCard(value: 'Biking', label: '🏍️ Biking'),
  MultiSelectCard(value: 'Cycling', label: '🚴 Cycling'),
  MultiSelectCard(value: 'Cultural Tours', label: '🛕 Cultural Tours'),
  MultiSelectCard(value: 'Festival Visits', label: '🎉 Festival Visits'),
  MultiSelectCard(value: 'Food Tasting', label: '🍛 Food Tasting'),
  MultiSelectCard(value: 'Shopping', label: '🛍️ Shopping'),
  MultiSelectCard(value: 'Photography', label: '📸 Photography'),
  MultiSelectCard(value: 'Meditation & Yoga', label: '🧘‍♂️ Meditation & Yoga'),
  MultiSelectCard(value: 'Temple Visits', label: '🙏 Temple Visits'),
  MultiSelectCard(value: 'Heritage Walks', label: '🚶 Heritage Walks'),
  MultiSelectCard(value: 'Stargazing', label: '🌌 Stargazing')
];
