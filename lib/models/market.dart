import 'package:cloud_firestore/cloud_firestore.dart';

class Market {
  String name;
  bool active;

  Market({
    this.name,
    this.active,
  });

  factory Market.fromDocument(DocumentSnapshot doc) {
    try {
      return Market(
        name: doc.data()['name'],
        active: doc.data()['active'],
      );
    } catch (e) {
      print('#########  Market  #########');
      print(e);
      return null;
    }
  }
}
