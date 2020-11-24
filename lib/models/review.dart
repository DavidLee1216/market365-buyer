import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  String userID, content, orderID;
  List imageUrls;
  bool active;
  Timestamp postingDate;

  Review({this.userID, this.active, this.orderID, this.imageUrls, this.postingDate, this.content});

  factory Review.fromDocument(DocumentSnapshot doc) {
    try {
      return Review(
        userID: doc.data()['userID'],
        active: doc.data()['active'],
        content: doc.data()['content'],
        orderID: doc.data()['orderID'],
        imageUrls: doc.data()['imageUrls'],
        postingDate: doc.data()['postingDate'],
      );
    } catch (e) {
      print('#########  Review  #########');
      print(e);
      return null;
    }
  }
}
