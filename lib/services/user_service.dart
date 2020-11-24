import 'dart:io';

import 'package:buyer/models/user_model.dart';
import 'package:buyer/services/alert_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

final ref = FirebaseFirestore.instance;

getCurrentUser() async {
  print(auth.FirebaseAuth.instance.currentUser.uid);
  DocumentSnapshot doc = await ref.collection('users').doc(auth.FirebaseAuth.instance.currentUser.uid).get();
  currentUser = User.fromDocument(doc);
  return true;
}

refreshUser() async {
  DocumentSnapshot doc = await ref.collection('users').doc(currentUser.userID).get();
  currentUser = User.fromDocument(doc);
}

checkIfUserExists() async {
  return await ref.collection('users').doc(auth.FirebaseAuth.instance.currentUser.uid).get();
}

addUser(User user) async {
  FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
  String firebaseToken = await _firebaseMessaging.getToken();
  await ref.collection('users').doc(auth.FirebaseAuth.instance.currentUser.uid).set({
    'userID': auth.FirebaseAuth.instance.currentUser.uid,
    'email': '',
    'name': user.name,
    'photoURL': user.photoURL,
    'mobile': user.kToken,
    'token': firebaseToken,
  }).catchError((error) {
    alert('Something went wrong\n$error');
  });
}

updateUser(User user) async {
  await ref.collection('users').doc(currentUser.userID).update(
    {
      'name': user.name,
      'mobile': user.kToken,
    },
  );
  await refreshUser();
}

uploadPhoto(pickedFile) async {
  StorageReference storageReference = FirebaseStorage.instance.ref().child('ProfilePhotos/${Uuid().v1()}.jpg');
  StorageUploadTask uploadTask = storageReference.putFile(File(pickedFile.path));
  await uploadTask.onComplete;
  print('File Uploaded');
  return storageReference.getDownloadURL();
}

updateProfilePhoto(String image) async {
  bool error = false;
  DocumentReference documentReference = ref.collection('users').doc(currentUser.userID);
  DocumentSnapshot doc = await documentReference.get();
  if (doc.exists) {
    documentReference.update(
      {'photoURL': image},
    ).catchError((e) {
      error = true;
      alert(e);
    });
    if (!error) await refreshUser();
  }
}

Future<DocumentSnapshot> getUser(id) async {
  return ref.collection('users').doc(id).get();
}

Stream<DocumentSnapshot> getUserStream(id) {
  return ref.collection('users').doc(id).snapshots();
}

Stream<QuerySnapshot> searchUsers(String query) {
  return ref.collection('users').where('name', isGreaterThanOrEqualTo: query).snapshots();
}
