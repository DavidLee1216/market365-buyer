import 'package:buyer/models/timetable.dart';
import 'package:buyer/screens/cart/address.dart';
import 'package:buyer/services/market_service.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/widget/custom_button.dart';
import 'package:buyer/widget/empty_box.dart';
import 'package:buyer/widget/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DeliveryTime extends StatefulWidget {
  final int total;

  DeliveryTime({this.total});

  @override
  _DeliveryTimeState createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  List<DateTime> headers = [
    DateTime.now(),
    DateTime.now().add(Duration(days: 1)),
    DateTime.now().add(Duration(days: 2)),
  ];

  DateTime selectedDate;
  String selectedTime;
  int selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 20,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '배송시간 지정',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                selectedMarket,
                textScaleFactor: 1.5,
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: getDeliveryTimeForMarket(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.docs.isNotEmpty) {
                      TimeTable timeTable =
                          TimeTable.fromDocument(snapshot.data.docs[0]);
                      List<DataRow> rows = List();

                      List<String> times = ['09.00', '11.00'];
                      for (int i = 0; i < times.length; i++) {
                        rows.add(myDataRow(
                            times[i],
                            timeTable.time[0][times[i]],
                            timeTable.time[1][times[i]],
                            timeTable.time[2][times[i]],
                            i));
                      }
                      return DataTable(
                        dividerThickness: 0,
                        columnSpacing: 20.0,
                        columns: [
                          DataColumn(label: Text('배송시간')),
                          DataColumn(
                              label: Text(
                                  DateFormat('dd MMM').format(headers[0]))),
                          DataColumn(
                              label: Text(
                                  DateFormat('dd MMM').format(headers[1]))),
                          DataColumn(
                              label: Text(
                                  DateFormat('dd MMM').format(headers[2]))),
                        ],
                        rows: rows,
                      );
                    } else
                      return EmptyBox(text: 'Nothing to show ');
                  } else
                    return LoadingData();
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(7),
              width: double.infinity,
              child: CustomButton(
                text: '다음 단계',
                function: () {
                  open(
                      context,
                      Address(
                          total: widget.total,
                          time: selectedTime,
                          date: selectedDate));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  myDataRow(String time, bool col1, bool col2, bool col3, int i) {
    return DataRow(cells: [
      DataCell(
        Center(
          child: Text(time, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      DataCell(
        Center(
          child: col1
              ? Radio(
                  groupValue: selected,
                  value: i + 3,
                  onChanged: (val) {
                    setState(() {
                      selectedDate = headers[i];
                      selectedTime = time;
                      print(i + 3);
                      selected = val;
                      print(selected);
                    });
                  })
              : Text(
                  'Closed',
                  style: TextStyle(
                      color:
                          col1 ? AppSettings.primaryColor : Color(0xffFF002E),
                      fontWeight: col1 ? FontWeight.bold : FontWeight.normal),
                ),
        ),
      ),
      DataCell(
        Center(
          child: col2
              ? Radio(
                  groupValue: selected,
                  value: i + 4,
                  onChanged: (val) {
                    setState(() {
                      selectedDate = headers[i];
                      selectedTime = time;
                      print(i + 4);
                      selected = val;
                      print(selected);
                    });
                  })
              : Text(
                  'Closed',
                  style: TextStyle(
                      color:
                          col2 ? AppSettings.primaryColor : Color(0xffFF002E),
                      fontWeight: col2 ? FontWeight.bold : FontWeight.normal),
                ),
        ),
      ),
      DataCell(
        Center(
          child: col3
              ? Radio(
                  groupValue: selected,
                  value: i + 5,
                  onChanged: (val) {
                    setState(() {
                      selectedDate = headers[i];
                      selectedTime = time;
                      print(i + 5);
                      selected = val;
                      print(selected);
                    });
                  })
              : Text(
                  'Closed',
                  style: TextStyle(
                      color:
                          col3 ? AppSettings.primaryColor : Color(0xffFF002E),
                      fontWeight: col3 ? FontWeight.bold : FontWeight.normal),
                ),
        ),
      ),
    ]);
  }
}
