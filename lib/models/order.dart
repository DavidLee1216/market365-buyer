import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  String name, user, time, request, address, payment, orderID;
  int delivery, total;
  Map fees;
  List history, products;
  Timestamp date, paidDate;

  Order({this.user, this.name, this.total, this.time, this.orderID, this.delivery, this.request, this.payment, this.address, this.history, this.date, this.paidDate, this.fees, this.products});

  factory Order.fromDocument(DocumentSnapshot doc) {
    try {
      return Order(
        user: doc.data()['user'],
        total: doc.data()['total'],
        name: doc.data()['name'],
        time: doc.data()['time'],
        orderID: doc.data()['orderID'],
        request: doc.data()['request'],
        address: doc.data()['address'],
        paidDate: doc.data()['paidDate'],
        payment: doc.data()['payment'],
        delivery: doc.data()['deliveryFee'],
        history: doc.data()['history'],
        fees: doc.data()['fees'],
        products: doc.data()['products'],
        date: doc.data()['date'],
      );
    } catch (e) {
      print('#########  Order  #########');
      print(e);
      return null;
    }
  }
}
