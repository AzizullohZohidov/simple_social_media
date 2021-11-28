import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository {
  late FirebaseAuth _auth;
  AuthenticationRepository() {
    _auth = FirebaseAuth.instance;
  }

  User? get currentUser => _auth.currentUser;

  Future<void> signUpAndSaveInDB({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
  }) async {
    await trySignUpNewUser(email: email, password: password);
    final _user = _auth.currentUser;
    final _userUid = _user!.uid;
    await saveUserInDB(
      uid: _userUid,
      email: email,
      firstName: firstName,
      lastName: lastName,
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
  }) async {
    FirebaseFirestore.instance.collection('users').doc(uid).set({
      'id': uid,
      'email': email.trim(),
      'firstName': firstName,
      'lastName': lastName,
      'createdAt': Timestamp.now(),
    });
  }
}
