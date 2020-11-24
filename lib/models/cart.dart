import 'package:cloud_firestore/cloud_firestore.dart';

class Cart {
  String userID;
  List products;
  int delivery;

  Cart({this.userID, this.products, this.delivery});

  factory Cart.fromDocument(DocumentSnapshot doc) {
    try {
      return Cart(
        userID: doc.data()['userID'],
        products: doc.data()['products'],
        delivery: doc.data()['delivery'],
      );
    } catch (e) {
      print('#########  Cart  #########');
      print(e);
      return null;
    }
  }
}
