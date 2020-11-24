import 'package:cloud_firestore/cloud_firestore.dart';

class TimeTable {
  String market;
  Timestamp date;
  Timestamp date2;
  Timestamp date3;
  List time;
  Map delivery;

  TimeTable({this.market, this.date, this.date2, this.date3, this.time, this.delivery});

  factory TimeTable.fromDocument(DocumentSnapshot doc) {
    try {
      return TimeTable(
        market: doc.data()['market'],
        date: doc.data()['date'],
        date2: doc.data()['date2'],
        date3: doc.data()['date3'],
        time: doc.data()['time'],
        delivery: doc.data()['delivery'],
      );
    } catch (e) {
      print('#########  TimeTable  #########');
      print(e);
      return null;
    }
  }
}
