import 'package:cloud_firestore/cloud_firestore.dart';

class Cart {
  String userID;
  List<CartProducts> products;
  int delivery;

  Cart({this.userID, this.products, this.delivery});

  factory Cart.fromDocument(DocumentSnapshot doc) {
    try {
      var list = doc.data()['product'] as List;
      List<CartProducts> cartProducts = list.map((i) => CartProducts.fromDocument(i)).toList();

      return Cart(
        userID: doc.data()['userID'],
        products: cartProducts ?? [],
        delivery: doc.data()['delivery'],
      );
    } catch (e) {
      print('#########  Cart  #########');
      print(e);
      return null;
    }
  }
}

class CartProducts {
  String productID;
  num quantity;
  Map options;

  CartProducts({this.productID, this.options, this.quantity});

  factory CartProducts.fromDocument(Map doc) {
    try {
      return CartProducts(
        productID: doc['productID'],
        quantity: doc['quantity'],
        options: doc['options'],
      );
    } catch (e) {
      print('#########  Cart Products  #########');
      print(e);
      return null;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'productID': productID,
      'quantity': quantity,
      'options': options,
    };
  }
}
