import 'package:buyer/models/order.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final ref = FirebaseFirestore.instance;

Future<QuerySnapshot> getOrders() async {
  print(currentUser.userID);
  return ref.collection('orders').where('userID', isEqualTo: currentUser.userID).get();
}

placeOrder(Order order) async {
  return ref.collection('orders').doc(order.orderID).set({
    'orderID': order.orderID,
    'name': order.name,
    'date': order.date,
    'address': order.address,
    'deliveryFee': order.delivery,
    'fees': order.fees,
    'history': order.history,
    'paidDate': order.paidDate,
    'payment': order.payment,
    'products': order.products,
    'request': order.request,
    'time': order.time,
    'userID': order.user,
    'total': order.total,
  });
}
