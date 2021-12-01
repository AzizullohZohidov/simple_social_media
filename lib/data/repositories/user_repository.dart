import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class UserRepository {
  late FirebaseAuth _auth;
  UserRepository() {
    _auth = FirebaseAuth.instance;
  }

  //Read current user info
  Future<UserModel?> getCurrentUser() async {
    try {
      var currentUser =
          await getUserUnderId(FirebaseAuth.instance.currentUser!.uid);
      //For debugging purposes only
      //print('Gets printed from inside of user_repository');
      //print(currentUser);
      return currentUser;
    } catch (error) {}
  }

  //Read user info given user id
  Future<UserModel?> getUserUnderId(String uid) async {
    String id;
    String email;
    String firstName;
    String lastName;
    String createdAt;
    String userProfileImageUrl;
    try {
      DocumentSnapshot userSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      id = userSnapshot.get('id');
      email = userSnapshot.get('email');
      firstName = userSnapshot.get('firstName');
      lastName = userSnapshot.get('lastName');
      createdAt = userSnapshot.get('createdAt');
      userProfileImageUrl = userSnapshot.get('userProfileImage');
      var user = UserModel(
        id: id,
        email: email,
        firstName: firstName,
        lastName: lastName,
        createdAt: createdAt,
        userPrfileImageUrl: userProfileImageUrl,
      );
      //For debuggin purposes only
      //print('Gets printed from inside of user_repository before returning');
      //print(user);
      return user;
    } catch (error) {}
  }
}
