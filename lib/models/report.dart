import 'package:cloud_firestore/cloud_firestore.dart';

class Report {
  String imageUrl;
  int year, period, total, seller, platform, pg, vat;

  Report({this.imageUrl, this.year, this.seller, this.platform, this.period, this.pg, this.vat, this.total});

  factory Report.fromDocument(DocumentSnapshot doc) {
    try {
      return Report(
        total: doc.data()['total'],
        platform: doc.data()['platform'],
        pg: doc.data()['pg'],
        period: doc.data()['period'],
        year: doc.data()['year'],
        imageUrl: doc.data()['imageUrl'],
        seller: doc.data()['seller'],
        vat: doc.data()['vat'],
      );
    } catch (e) {
      print('#########  Report  #########');
      print(e);
      return null;
    }
  }
}
