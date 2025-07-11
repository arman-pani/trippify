import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trippify/models/user_model.dart';
import 'package:trippify/utils/enum_classes.dart';
import 'package:trippify/utils/firestore_methods.dart';
import 'package:trippify/utils/shared_prefs_methods.dart';

class EditProfileController extends GetxController {
  final FirestoreMethods firestoreMethods = FirestoreMethods();

  late UserModel userModel;

  AgeRange selectedAgeRange = AgeRange.group18To24;
  Gender selectedGender = Gender.male;
  TravellerType selectedTravellerType = TravellerType.solo;
  TextEditingController usernameController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _initUser();
  }

  Future<void> _initUser() async {
    userModel = await SharedPrefsMethods.getUserInfo();
    usernameController.text = userModel.username;
    bioController.text = userModel.bio ?? '';
    selectedAgeRange = userModel.age;
    selectedGender = userModel.gender;
    selectedTravellerType = userModel.travellerType;
    update();
  }

  onAgeRangeChanged(Enum? newValue) {
    if (newValue != null) {
      selectedAgeRange = newValue as AgeRange;
    }
  }

  onGenderChanged(Enum? newValue) {
    if (newValue != null) {
      selectedGender = newValue as Gender;
    }
  }

  onTravellerTypeChanged(Enum? newValue) {
    if (newValue != null) {
      selectedTravellerType = newValue as TravellerType;
    }
  }

  void updateUserInfo(BuildContext context) {
    debugPrint(userModel.toString());
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Update Profile'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Do you want to implement this changes?'),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () async {
                      final newUserModel = userModel.copyWith(
                        username: usernameController.text.trim(),
                        bio: bioController.text.trim(),
                        age: selectedAgeRange,
                        travellerType: selectedTravellerType,
                        gender: selectedGender,
                        creationDateTime: userModel.creationDateTime,
                      );
                      await firestoreMethods.updateUserInfo(newUserModel);
                      await SharedPrefsMethods.saveUserInfo(newUserModel);

                      context.pop();
                    },
                    child: Text('Yes')),
                TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text('No'))
              ],
            )
          ],
        ),
      ),
    );
    Get.defaultDialog(
      title: 'Update Profile',
      middleText: 'Do you want to implement this changes?',
      textConfirm: 'Yes',
      textCancel: 'No',
      onConfirm: () {
        firestoreMethods.updateUserInfo(
          UserModel(
            username: usernameController.text.trim(),
            bio: bioController.text.trim(),
            age: selectedAgeRange,
            travellerType: selectedTravellerType,
            gender: selectedGender,
            creationDateTime: userModel.creationDateTime,
          ),
        );
      },
    );
  }
}
