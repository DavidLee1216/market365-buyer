import 'package:buyer/models/cart.dart';
import 'package:buyer/models/order.dart';
import 'package:buyer/services/cart_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final ref = FirebaseFirestore.instance;

Future<QuerySnapshot> getOrders() async {
  print(currentUser.userID);
  return ref.collection('orders').where('userID', isEqualTo: currentUser.userID).get();
}

Future<DocumentSnapshot> getCartItems() {
  return ref.collection('cart').doc(currentUser.userID).get();
}

placeOrder(Order order) async {
  DocumentSnapshot documentSnapshot = await getCartItems();
  Cart cart = Cart.fromDocument(documentSnapshot);
  List<Map> products = List();
  for (int i = 0; i < cart.products.length; i++)
    products.add({
      'productID': cart.products[i].productID,
      'quantity': cart.products[i].quantity,
      'options': cart.products[i].options,
    });

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
    'products': products,
    'request': order.request,
    'time': order.time,
    'userID': order.user,
    'total': order.total,
  });

  await clearCart();
}
