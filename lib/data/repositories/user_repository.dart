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
      var currentUser =
          await getUserUnderId(FirebaseAuth.instance.currentUser!.uid);
      //For debuggin purposes only
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
    try {
      /*FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get()
          .then<dynamic>((DocumentSnapshot snapshot) async {
          id = snapshot.get('id');
          email = snapshot.get('email');
          firstName = snapshot.get('firstName');
          lastName = snapshot.get('lastName');
          createdAt = snapshot.get('createdAt';,
        print('Id gets printed from inside of user_repository before returning');
        print(id);
        //return user;
      });*/

      DocumentSnapshot userSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      id = userSnapshot.get('id');
      email = userSnapshot.get('email');
      firstName = userSnapshot.get('firstName');
      lastName = userSnapshot.get('lastName');
      createdAt = userSnapshot.get('createdAt');
      var user = UserModel(
        id: id,
        email: email,
        firstName: firstName,
        lastName: lastName,
        createdAt: createdAt,
      );
      //For debuggin purposes only
      //print('Gets printed from inside of user_repository before returning');
      //print(user);
      return user;
    } catch (error) {}
  }
}
