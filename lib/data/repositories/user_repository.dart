import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:simple_social_media/data/models/pin_model.dart';
import 'package:simple_social_media/data/repositories/pin_repository.dart';
import '../models/user_model.dart';

class UserRepository {
  late FirebaseAuth _auth;
  final PinRepository pinRepository;
  UserRepository({required this.pinRepository}) {
    _auth = FirebaseAuth.instance;
  }

  //Read current user info
  Future<UserModel?> getCurrentUser() async {
    try {
      var currentUser =
          await getUserUnderId(FirebaseAuth.instance.currentUser!.uid);
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
    List<String> pinIds = [];
    String userProfileImageUrl;
    try {
      DocumentSnapshot userSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      id = userSnapshot.get('id');
      email = userSnapshot.get('email');
      firstName = userSnapshot.get('firstName');
      lastName = userSnapshot.get('lastName');
      createdAt = userSnapshot.get('createdAt');
      List temp = userSnapshot.get('pinIds');
      for (var element in temp) {
        pinIds.add(element.toString());
      }
      List<PinModel> userPins =
          await pinRepository.fetchArrayOfPins(pinDocIds: pinIds);
      userProfileImageUrl = userSnapshot.get('userProfileImage');
      var user = UserModel(
        id: id,
        email: email,
        firstName: firstName,
        lastName: lastName,
        createdAt: createdAt,
        userPins: userPins,
        userProfileImageUrl: userProfileImageUrl,
      );
      return user;
    } catch (error) {}
  }
}
