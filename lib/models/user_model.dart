import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String userID;
  final String name;
  final String email;
  final String photoURL;
  final String kToken;
  final String nToken;
  final String lastMarket;
  final String type;
  final bool promotion;
  final String token;

  User({
    this.email,
    this.userID,
    this.photoURL,
    this.name,
    this.kToken,
    this.nToken,
    this.lastMarket,
    this.type,
    this.promotion,
    this.token,
  });

  factory User.fromDocument(DocumentSnapshot doc) {
    try {
      return User(
        userID: doc.data()['userID'],
        name: doc.data()['name'],
        email: doc.data()['email'],
        photoURL: doc.data()['photoURL'],
        kToken: doc.data()['kToken'],
        nToken: doc.data()['nToken'],
        lastMarket: doc.data()['lastMarket'],
        type: doc.data()['type'],
        promotion: doc.data()['promotion'],
        token: doc.data()['token'],
      );
    } catch (e) {
      print('##########  User  ###########');
      print(e);
      return null;
    }
  }
}
