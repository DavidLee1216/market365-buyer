import 'package:cloud_firestore/cloud_firestore.dart';

class Pictures {
  String name, imageUrl;
  List tags;

  Pictures({this.name, this.tags, this.imageUrl});

  factory Pictures.fromDocument(DocumentSnapshot doc) {
    try {
      return Pictures(
        name: doc.data()['name'],
        tags: doc.data()['tags'],
        imageUrl: doc.data()['imageUrl'],
      );
    } catch (e) {
      print('#########  Pictures  #########');
      print(e);
      return null;
    }
  }
}
