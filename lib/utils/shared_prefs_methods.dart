import 'package:shared_preferences/shared_preferences.dart';
import 'package:trippify/models/user_model.dart';
import 'package:trippify/utils/enum_classes.dart';

class SharedPrefsMethods {
  static Future<String?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }

  static Future<void> saveUserId(String userid) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('userId', userid);
  }

  static Future<void> saveUserInfo(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('userId', user.id ?? '');
    await prefs.setString('username', user.username);
    await prefs.setString('profileImage', user.profileImage ?? '');
    await prefs.setString('bio', user.bio ?? '');
    await prefs.setString('ageRange', user.age.toString());
    await prefs.setString('gender', user.gender.toString());
    await prefs.setString('travellerType', user.travellerType.toString());
    await prefs.setStringList('preferredPlaces', user.prefferedPlaces);
    await prefs.setStringList('preferredActivities', user.prefferedActivities);
    await prefs.setString(
        'creationDateTime', user.creationDateTime.toIso8601String());
  }

  static Future<UserModel> getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userId = prefs.getString('userId');
    String? username = prefs.getString('username');
    String? profileImage = prefs.getString('profileImage');
    String? bio = prefs.getString('bio');
    String? ageRange = prefs.getString('ageRange');
    String? gender = prefs.getString('gender');
    String? travellerType = prefs.getString('travellerType');
    List<String>? preferredPlaces = prefs.getStringList('preferredPlaces');
    List<String>? preferredActivities =
        prefs.getStringList('preferredActivities');
    String? creationDateTimeStr = prefs.getString('creationDateTime');

    return UserModel(
      id: userId,
      username: username ?? '',
      profileImage: profileImage,
      bio: bio,
      age: AgeRange.fromString(ageRange ?? ''),
      gender: Gender.fromString(gender ?? ''),
      travellerType: TravellerType.fromString(travellerType ?? ''),
      prefferedPlaces: preferredPlaces ?? [],
      prefferedActivities: preferredActivities ?? [],
      creationDateTime: creationDateTimeStr != null
          ? DateTime.parse(creationDateTimeStr)
          : DateTime.now(),
    );
  }

  static Future<void> clearUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
