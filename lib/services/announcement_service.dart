import 'package:cloud_firestore/cloud_firestore.dart';

final ref = FirebaseFirestore.instance;

Future<QuerySnapshot> getAnnouncements() {
  return ref.collection('announcements').get();
}
