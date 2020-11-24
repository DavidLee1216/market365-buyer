import 'package:cloud_firestore/cloud_firestore.dart';

final ref = FirebaseFirestore.instance;

Future<QuerySnapshot> getEvents() {
  return ref.collection('events').get();
}
