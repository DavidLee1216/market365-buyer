import 'package:cloud_firestore/cloud_firestore.dart';

class Announcement {
  String title, content;
  List markets;
  bool active;
  Timestamp postingDate;

  Announcement({this.title, this.active, this.postingDate, this.markets, this.content});

  factory Announcement.fromDocument(DocumentSnapshot doc) {
    try {
      return Announcement(
        title: doc.data()['title'],
        active: doc.data()['active'],
        content: doc.data()['content'],
        postingDate: doc.data()['postingDate'],
        markets: doc.data()['markets'],
      );
    } catch (e) {
      print('#########  Announcement  #########');
      print(e);
      return null;
    }
  }
}
