import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PinRepository {
  late FirebaseAuth _auth;
  PinRepository() {
    _auth = FirebaseAuth.instance;
  }

  Future<void> uploadPin({
    required File pinImageFile,
    required String pinName,
    required String pinDescription,
  }) async {
    final currentUserId = await _getCurrentUserId();
    _uploadPinToFirebase(
      pinImageFile: pinImageFile,
      pinName: pinName,
      pinDescription: pinDescription,
      userId: currentUserId,
    );
  }

  //Uploads pin details and returns autogenerated document id for _uploadPinImage
  Future<void> _uploadPinToFirebase({
    required File pinImageFile,
    required String pinName,
    required String pinDescription,
    required String userId,
  }) async {
    final pinDocId = FirebaseFirestore.instance.collection('pins').doc().id;
    print('New documet id is' + pinDocId);
    final pinImageUrl = await _uploadPinImage(
      pinImageFile: pinImageFile,
      pinDocumentId: pinDocId,
    );
    await _uploadPinDetails(
      userId: userId,
      pinDocId: pinDocId,
      pinImageUrl: pinImageUrl,
      pinName: pinName,
      pinDescription: pinDescription,
    );
  }

  //Uploads image to storage uder id returned by _uploadPinNameDetails and returns download link
  Future<String> _uploadPinImage({
    required File pinImageFile,
    required String pinDocumentId,
  }) async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('postImages')
        .child(pinDocumentId + '_pin_picture' + '.jpg');
    await ref.putFile(pinImageFile);
    var pinImageUrl = await ref.getDownloadURL();
    return pinImageUrl;
  }

  Future<void> _uploadPinDetails({
    required String userId,
    required String pinDocId,
    required String pinImageUrl,
    required String pinName,
    required String pinDescription,
  }) async {
    return FirebaseFirestore.instance.collection('pins').doc(pinDocId).set({
      'userId': userId,
      'pinId': pinDocId,
      'pinImageUrl': pinImageUrl,
      'pinName': pinName,
      'pinDescription': pinDescription,
      'createdAt': DateTime.now().toString(),
    });
  }

  Future<String> _getCurrentUserId() async {
    return _auth.currentUser!.uid;
  }
}
