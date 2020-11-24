import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String imageUrl;
  bool active;
  Timestamp expiringDate;
  List markets;

  Event({this.imageUrl, this.active, this.expiringDate, this.markets});

  factory Event.fromDocument(DocumentSnapshot doc) {
    try {
      return Event(
        imageUrl: doc.data()['imageUrl'],
        active: doc.data()['active'],
        expiringDate: doc.data()['expiringDate'],
        markets: doc.data()['markets'],
      );
    } catch (e) {
      print('#########  Event  #########');
      print(e);
      return null;
    }
  }
}
