import 'package:buyer/models/extras.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String title;
  num price;
  String productID;
  String productOwner;
  String subtitle;
  String description;
  String imageUrl;
  List market;
  List stores;
  Map options;
  bool active;
  String category;
  bool isMarket;
  bool isBest;
  bool isToday;
  bool isSignature;
  num sale;
  num quantity;
  List<Extras> extras;

  Product({this.description, this.isSignature, this.extras, this.quantity, this.productID, this.productOwner, this.price, this.title, this.category, this.active, this.imageUrl, this.isBest, this.isMarket, this.isToday, this.market, this.options, this.sale, this.stores, this.subtitle});

  factory Product.fromDocument(DocumentSnapshot doc) {
    try {
      Map map = doc.data()['options'];

      List<Extras> extras = List();
      List<String> keys = map.keys.toList();
      List values = map.values.toList();
      for (int i = 0; i < keys.length; i++)
        extras.add(Extras(
          selected: false,
          key: keys[i],
          value: values[i],
        ));

      return Product(
        title: doc.data()['title'],
        price: doc.data()['price'],
        isSignature: doc.data()['isSignature'],
        productID: doc.data()['productID'],
        productOwner: doc.data()['productOwner'],
        subtitle: doc.data()['subtitle'],
        description: doc.data()['description'],
        imageUrl: doc.data()['imageUrl'],
        market: doc.data()['market'],
        stores: doc.data()['stores'],
        options: doc.data()['options'],
        active: doc.data()['active'],
        category: doc.data()['category'],
        isMarket: doc.data()['isMarket'],
        isBest: doc.data()['isBest'],
        isToday: doc.data()['isToday'],
        sale: doc.data()['sale'],
        extras: extras,
        quantity: 1,
      );
    } catch (e) {
      print('#########  Product  #########');
      print(e);
      return null;
    }
  }
}
