import 'package:cloud_firestore/cloud_firestore.dart';

class Recipe {
  String title, content, imageUrl, productID;
  List markets;
  bool active;

  Recipe({this.title, this.active, this.productID, this.imageUrl, this.markets, this.content});

  factory Recipe.fromDocument(DocumentSnapshot doc) {
    try {
      return Recipe(
        title: doc.data()['title'],
        active: doc.data()['active'],
        content: doc.data()['content'],
        productID: doc.data()['productID'],
        imageUrl: doc.data()['imageUrl'],
        markets: doc.data()['markets'],
      );
    } catch (e) {
      print('#########  Recipe  #########');
      print(e);
      return null;
    }
  }
}
