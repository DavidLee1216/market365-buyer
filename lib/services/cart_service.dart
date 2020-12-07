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
    var productArray = doc.data()['product'];
    int idxToUpdate = 0;
    bool bSet = true;
    for(int i = 0; i < doc.data()['product'].length; i++){
      if(doc.data()['product'][i]['productID']==product.productID && mapsEqual(doc.data()['product'][i]['options'], options))
      {
        bSet = false;
        idxToUpdate = i;
        break;
      }
    }
    if(bSet)
      productArray.add(productToAdd);
    else
      productArray[idxToUpdate]['quantity'] = product.quantity;
    print(productArray);
    if(bSet)
      await ref.collection('cart').doc(currentUser.userID).set({
        'userID': currentUser.userID,
        'product': productArray,
      }, SetOptions(merge: true));
    else
      await ref.collection('cart').doc(currentUser.userID).update({
        'userID': currentUser.userID,
        'product': productArray,
      });
  } else {
    await ref.collection('cart').doc(currentUser.userID).set({
      'userID': currentUser.userID,
      'product': [productToAdd],
    });
  }
}

bool mapsEqual(Map a, Map b) {
  if (a == b) return true;
  if (a == null || b == null) return false;
  if (a.length != b.length) return false;

  for (final k in a.keys) {
    var bValue = b[k];
    if (bValue == null && !b.containsKey(k)) return false;
    if (bValue != a[k]) return false;
  }

  return true;
}