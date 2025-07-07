import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trippify/models/user_model.dart';

class FirestoreMethods {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> addUserInfo(UserModel user) async {
    await db.collection('users').doc(user.id).set(user.toMap());
  }

  Future<void> updateUserInfo(UserModel newUser) async {
    await db.collection('users').doc(newUser.id).update(newUser.toMap());
  }

  Future<UserModel> getUserInfo(String userId) async {
    final snapshot = await db.collection('users').doc(userId).get();
    return UserModel.fromMap(snapshot.data()!);
  }
}
