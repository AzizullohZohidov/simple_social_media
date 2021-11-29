import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:simple_social_media/data/models/user_model.dart';

class UserRepository {
  late FirebaseAuth _auth;
  UserRepository() {
    _auth = FirebaseAuth.instance;
  }

  //Read current user info
  Future<UserModel?> getCurrentUser() async {
    try {
      return await getUserUnderId(FirebaseAuth.instance.currentUser!.uid);
    } catch (error) {}
  }

  //Read user info given user id
  Future<UserModel?> getUserUnderId(String uid) async {
    UserModel user;
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get()
          .then<dynamic>((DocumentSnapshot snapshot) async {
        user = UserModel(
          id: snapshot.get('id'),
          email: snapshot.get('email'),
          firstName: snapshot.get('firstName'),
          lastName: snapshot.get('lastName'),
          createdAt: snapshot.get('createdAt').toDate(),
        );
        return user;
      });
    } catch (error) {}
  }
}
