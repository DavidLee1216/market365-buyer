import 'package:buyer/models/cart.dart';
import 'package:buyer/models/product.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final ref = FirebaseFirestore.instance;

Stream<DocumentSnapshot> getCartItems() {
  return ref.collection('cart').doc(currentUser.userID).snapshots();
}

removeFromCart(CartProducts product) async {
  await ref.collection('cart').doc(currentUser.userID).update({
    'product': FieldValue.arrayRemove([product.toMap()]),
    'userID': currentUser.userID,
  });
}

clearCart() async {
  await ref.collection('cart').doc(currentUser.userID).delete();
}

addToCart(Product product) async {
  DocumentSnapshot doc = await ref.collection('cart').doc(currentUser.userID).get();
  Map options = Map();
  for (int i = 0; i < product.extras.length; i++) {
    if (product.extras[i].selected) options.addAll({product.extras[i].key: product.extras[i].value});
  }

  Map productToAdd;
  productToAdd = ({
    'productID': product.productID,
    'options': options,
    'quantity': product.quantity,
  });

  if (doc.exists) {
    await ref.collection('cart').doc(currentUser.userID).update({
      'userID': currentUser.userID,
      'product': [productToAdd],
    });
  } else {
    await ref.collection('cart').doc(currentUser.userID).set({
      'userID': currentUser.userID,
      'product': [productToAdd],
    });
  }
}
