import 'package:buyer/models/store_review.dart';
import 'package:buyer/services/alert_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final ref = FirebaseFirestore.instance;

Future<QuerySnapshot> getStoresForCategory(String category) async {
  return ref.collection('stores').where('categories', arrayContains: category).where('market', isEqualTo: selectedMarket).get();
}

getStoreReviews(String storeID) {
  return ref.collection('store_reviews').where('storeID', isEqualTo: storeID).get();
}

getMyStoreReviews() {
  return ref.collection('store_reviews').where('userID', isEqualTo: currentUser.userID).get();
}

postStoreReview(StoreReview review) async {
  bool error = false;
  await ref.collection('store_reviews').doc().set({
    'active': review.active,
    'content': review.content,
    'imageUrls': review.imageUrls,
    'storeID': review.storeID,
    'postingDate': review.postingDate,
    'userID': currentUser.userID,
  }).catchError((e) {
    error = true;
    alert('Error posting review\n\n${e.toString()}');
    print(e.toString());
  });
  if (!error)
    await ref.collection('stores').doc(review.storeID).update({
      'reviews': FieldValue.increment(1),
    });
}
