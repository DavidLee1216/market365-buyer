import 'dart:io';

import 'package:buyer/models/product.dart';
import 'package:buyer/models/review.dart';
import 'package:buyer/services/alert_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

final ref = FirebaseFirestore.instance;

Future<QuerySnapshot> getProductsList(String type, bool isLimited) {
  return !isLimited ? ref.collection('products').where(type, isEqualTo: true).where('market', arrayContains: selectedMarket).get() : ref.collection('products').where(type, isEqualTo: true).where('market', arrayContains: selectedMarket).limit(5).get();
}

Future<QuerySnapshot> getRecipesList(bool isLimited) {
  return !isLimited ? ref.collection('recipes').where('markets', arrayContains: selectedMarket).get() : ref.collection('recipes').where('markets', arrayContains: selectedMarket).limit(5).get();
}

Future<DocumentSnapshot> getProduct(String productID) {
  return ref.collection('products').doc(productID).get();
}

Future<QuerySnapshot> searchProducts(String query) {
  return ref.collection('products').where('title', isGreaterThanOrEqualTo: query).get();
}

addComment(Product product, String comment) async {
  int createdDateTime = DateTime.now().millisecondsSinceEpoch;
  await ref.collection('comments').doc().set({
    'productID': product.productID,
    'userID': currentUser.userID,
    'comment': comment,
    'createdDateTime': createdDateTime,
  });
}

getComments(String productID) {
  return ref.collection('comments').where('productID', isEqualTo: productID).orderBy('createdDateTime', descending: true).snapshots();
}

uploadReviewPhoto(pickedFile) async {
  StorageReference storageReference = FirebaseStorage.instance.ref().child('reviews/${Uuid().v1()}.jpg');
  StorageUploadTask uploadTask = storageReference.putFile(File(pickedFile.path));
  await uploadTask.onComplete;
  print('File Uploaded');
  return storageReference.getDownloadURL();
}

uploadStoreReviewPhoto(pickedFile) async {
  StorageReference storageReference = FirebaseStorage.instance.ref().child('store_reviews/${Uuid().v1()}.jpg');
  StorageUploadTask uploadTask = storageReference.putFile(File(pickedFile.path));
  await uploadTask.onComplete;
  print('File Uploaded');
  return storageReference.getDownloadURL();
}

postReview(Review review) async {
  bool error = false;
  await ref.collection('reviews').doc().set({
    'active': review.active,
    'content': review.content,
    'imageUrls': review.imageUrls,
    'orderID': review.orderID,
    'postingDate': review.postingDate,
    'userID': currentUser.userID,
  }).catchError((e) {
    error = true;
    alert('Error posting review\n\n${e.toString()}');
    print(e.toString());
  });
}

Future<QuerySnapshot> getSignatureProducts(String storeID) {
  return ref.collection('products').where('isSignature', isEqualTo: true).where('stores', arrayContains: storeID).get();
}

Future<QuerySnapshot> getStoreProducts(String storeID) {
  return ref.collection('products').where('stores', arrayContains: storeID).get();
}
