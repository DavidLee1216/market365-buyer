import 'package:cloud_firestore/cloud_firestore.dart';

class Store {
  String name, description, tel, userID, taxId, address, market, storeID;
  int openHour, closeHour;
  List closeDays;
  bool active;
  List categories;
  num reviews;

  Store({this.market, this.name, this.description, this.reviews, this.storeID, this.userID, this.tel, this.taxId, this.address, this.openHour, this.closeDays, this.closeHour, this.active, this.categories});

  factory Store.fromDocument(DocumentSnapshot doc) {
    try {
      return Store(
        market: doc.data()['market'],
        storeID: doc.data()['storeID'],
        name: doc.data()['name'],
        reviews: doc.data()['reviews'],
        description: doc.data()['description'],
        tel: doc.data()['tel'],
        address: doc.data()['address'],
        userID: doc.data()['userID'],
        taxId: doc.data()['taxID'],
        active: doc.data()['active'],
        openHour: doc.data()['openHour'],
        closeHour: doc.data()['closeHour'],
        closeDays: doc.data()['closedDays'],
        categories: doc.data()['categories'],
      );
    } catch (e) {
      print('#########  Store  #########');
      print(e);
      return null;
    }
  }
}
