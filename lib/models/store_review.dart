import 'package:cloud_firestore/cloud_firestore.dart';

class StoreReview {
  String userID, content, storeID;
  List imageUrls;
  bool active;
  Timestamp postingDate;

  StoreReview({this.userID, this.active, this.storeID, this.imageUrls, this.postingDate, this.content});

  factory StoreReview.fromDocument(DocumentSnapshot doc) {
    try {
      return StoreReview(
        userID: doc.data()['userID'],
        active: doc.data()['active'],
        content: doc.data()['content'],
        storeID: doc.data()['storeID'],
        imageUrls: doc.data()['imageUrls'],
        postingDate: doc.data()['postingDate'],
      );
    } catch (e) {
      print('######### Store Review  #########');
      print(e);
      return null;
    }
  }
}
