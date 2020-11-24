import 'package:buyer/utils/app_settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final ref = FirebaseFirestore.instance;

getMarkets() async {
  return ref.collection('markets').orderBy('name').get();
}

getDeliveryTimeForMarket() {
  return ref.collection('timetables').where('market', isEqualTo: selectedMarket).get();
}
