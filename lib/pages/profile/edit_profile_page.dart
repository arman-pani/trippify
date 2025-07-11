import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:trippify/constants/colors_constants.dart';
import 'package:trippify/pages/profile/edit_profile_controller.dart';
import 'package:trippify/utils/enum_classes.dart';
import 'package:trippify/widgets/custom_gradient_button.dart';
import 'package:trippify/widgets/custom_textfield.dart';
import 'package:trippify/widgets/dropdown_textfield.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: GetBuilder<EditProfileController>(
          init: EditProfileController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 20,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: ColorsConstants.blueColor,
                    backgroundImage:
                        NetworkImage("https://picsum.photos/id/16/200/300"),
                  ),
                  CustomTextfield(
                    hintText: 'Enter your username',
                    labelText: 'Username',
                    controller: controller.usernameController,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownTextfield(
                          hintText: 'Enter your age',
                          labelText: 'Age Range',
                          initialValue: controller.selectedAgeRange,
                          dropDownList: AgeRange.values,
                          onChanged: controller.onAgeRangeChanged,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: DropdownTextfield(
                          hintText: 'Enter your gender',
                          labelText: 'Gender',
                          initialValue: controller.selectedGender,
                          dropDownList: Gender.values,
                          onChanged: controller.onGenderChanged,
                        ),
                      ),
                    ],
                  ),
                  DropdownTextfield(
                    hintText: 'What type of traveller are you?',
                    labelText: 'What type of traveller are you?',
                    dropDownList: TravellerType.values,
                    initialValue: controller.selectedTravellerType,
                    onChanged: controller.onTravellerTypeChanged,
                  ),
                  CustomTextfield(
                    hintText: 'Tell the world about yourself!',
                    labelText: 'Bio',
                    maxlines: 5,
                    controller: controller.bioController,
                  ),
                  CustomGradientButton(
                    label: 'Update Profile',
                    onPressed: () => controller.updateUserInfo(context),
                  )
                ],
              ),
            );
          }),
    );
  }
}
