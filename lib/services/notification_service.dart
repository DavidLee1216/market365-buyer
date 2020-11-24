import 'dart:convert';
import 'dart:io';

import 'package:buyer/models/user_model.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

final ref = FirebaseFirestore.instance;
final String serverToken = 'AAAANiWhhDo:APA91bGKIres1WHnogOy_5yd0NQEuRpaoINyqy76hB1tlxfAEmuEJ8pjX6Vp-gyQAaX_a9w03TUtzXrHUekWqHsGPCBJcABcybjXgRM-G-DLt3bWV39J0QOyMh3hd5bXwOctsyhW8_ri';
final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

registerFirebase(BuildContext context) async {
  if (Platform.isIOS) getiOSPermission();
  String firebaseToken = await firebaseMessaging.getToken();

  ref.collection('users').doc(currentUser.userID).update({
    'token': firebaseToken,
  });
  firebaseMessaging.configure(
    onMessage: (Map<String, dynamic> message) async {
      print('on message $message');
    },
    onResume: (Map<String, dynamic> message) async {
      print('on resume $message');
    },
    onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');
    },
  );
}

getIcon(String type) {
  if (type == 'like_business') return Icon(FontAwesomeIcons.heart, color: Colors.white, size: 20);
  if (type == 'like_event') return Icon(FontAwesomeIcons.heart, color: Colors.white, size: 20);
  if (type == 'follow') return Icon(Icons.person_add_outlined, color: Colors.white, size: 20);
  if (type == 'review') return Icon(Icons.star, color: Colors.white, size: 20);
}

getTitle(String type) {
  if (type == 'like_business') return ' liked your business';
  if (type == 'like_event') return ' liked your event';
  if (type == 'follow') return ' started following you';
  if (type == 'review') return ' reviewed your business';
}

getiOSPermission() {
  firebaseMessaging.requestNotificationPermissions(IosNotificationSettings(alert: true, badge: true, provisional: true, sound: true));
  firebaseMessaging.onIosSettingsRegistered.listen((event) {
    print("IOS Settings : $event");
  });
}

sendNotification({String type, User receiver, String eventID, String businessID}) async {
  if (currentUser.userID != receiver.userID)
    await http.post(
      'https://fcm.googleapis.com/fcm/send',
      headers: <String, String>{'Content-Type': 'application/json', 'Authorization': 'key=$serverToken'},
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': getTitle(type),
            'title': currentUser.name,
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done',
            'type': type,
            'businessID': businessID,
            'eventID': eventID,
          },
          'to': receiver.token, //"/topics/all",
        },
      ),
    );

  await ref.collection('notifications').doc(receiver.userID).collection('feed').doc().set({
    'userID': currentUser.userID,
    'type': type,
    'businessID': businessID,
    'eventID': eventID,
    'timestamp': DateTime.now().millisecondsSinceEpoch,
  });
}

removeNotification({String eventID, String businessID, String userID, String type}) async {}

sendMessage({String body, String token, String chatRoomID, String image, String name, String email, String type}) async {
  //print(navigationParameters);
  DocumentSnapshot documentSnapshot = await ref.collection('users').doc(currentUser.userID).get();
  String senderName = documentSnapshot.data()['name'];
  await http.post(
    'https://fcm.googleapis.com/fcm/send',
    headers: <String, String>{'Content-Type': 'application/json', 'Authorization': 'key=$serverToken'},
    body: jsonEncode(
      <String, dynamic>{
        'notification': <String, dynamic>{
          'title': senderName,
          'body': body,
        },
        'priority': 'high',
        'data': <String, dynamic>{
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'id': '1',
          'status': 'done',
          'type': type,
          'chatRoomID': chatRoomID,
          'image': image,
          'name': name,
          'email': email,
        },
        'to': token, //"/topics/all",
      },
    ),
  );
}

getNotificationSettings() {
  return ref.collection('notifications').doc(currentUser.userID).snapshots();
}

getNotificationFeed() {
  return ref.collection('notifications').doc(currentUser.userID).collection('feed').orderBy('timestamp', descending: true).snapshots();
}

updateNotifications(String key, bool value) {
  return ref.collection('notifications').doc(currentUser.userID).update({
    key: value,
  });
}
