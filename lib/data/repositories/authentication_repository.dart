import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthenticationRepository {
  late FirebaseAuth _auth;
  AuthenticationRepository() {
    _auth = FirebaseAuth.instance;
  }

  User? get currentUser => _auth.currentUser;

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    await _auth.signInWithEmailAndPassword(
      email: email.trim().toLowerCase(),
      password: password.trim(),
    );
  }

  Future<void> signUpAndSaveInDB({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required File imageFile,
  }) async {
    await trySignUpNewUser(email: email, password: password);
    final _user = _auth.currentUser;
    final _userUid = _user!.uid;
    await saveUserInDB(
      uid: _userUid,
      email: email,
      firstName: firstName,
      lastName: lastName,
      imageFile: imageFile,
    );
  }

  Future<void> trySignUpNewUser({
    required String email,
    required String password,
  }) async {
    await _auth.createUserWithEmailAndPassword(
      email: email.trim().toLowerCase(),
      password: password.trim(),
    );
  }

  Future<void> saveUserInDB({
    required String uid,
    required String email,
    required String firstName,
    required String lastName,
    required File imageFile,
  }) async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('userImage')
        .child(uid + '_picture' + '.jpg');
    await ref.putFile(imageFile);
    var userProfileImageUrl = await ref.getDownloadURL();
    FirebaseFirestore.instance.collection('users').doc(uid).set({
      'id': uid,
      'userProfileImage': userProfileImageUrl,
      'email': email.trim(),
      'firstName': firstName,
      'lastName': lastName,
      'pinImageIds': [],
      'createdAt': DateTime.now().toString(),
    });
  }
}
