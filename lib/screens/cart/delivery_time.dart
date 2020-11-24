import 'package:buyer/models/timetable.dart';
import 'package:buyer/screens/cart/address.dart';
import 'package:buyer/services/market_service.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/utils/app_settings.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Delivery Time',
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
                  TimeTable timeTable = TimeTable.fromDocument(snapshot.data.docs[0]);
                  List<DataRow> rows = List();

                  List<String> times = ['09.00', '11.00'];
                  for (int i = 0; i < times.length; i++) {
                    rows.add(myDataRow(times[i], timeTable.time[0][times[i]], timeTable.time[1][times[i]], timeTable.time[2][times[i]], i));
                  }
                  return DataTable(
                    dividerThickness: 0,
                    columnSpacing: 20.0,
                    columns: [
                      DataColumn(label: Text('Delivery Time')),
                      DataColumn(label: Text(DateFormat('dd MMM').format(headers[0]))),
                      DataColumn(label: Text(DateFormat('dd MMM').format(headers[1]))),
                      DataColumn(label: Text(DateFormat('dd MMM').format(headers[2]))),
                    ],
                    rows: rows,
                  );
                } else
                  return EmptyBox(text: 'Nothing to show ');
              } else
                return LoadingData();
            },
          )),
        ],
      ),
    );
  }

  myDataRow(String time, bool col1, bool col2, bool col3, int i) {
    return DataRow(cells: [
      DataCell(Center(
        child: Text(time, style: TextStyle(fontWeight: FontWeight.bold)),
      )),
      DataCell(InkWell(
        onTap: () {
          if (col1) open(context, Address(date: headers[i], time: time, total: widget.total));
        },
        child: Center(
          child: Text(
            col1 ? '○' : 'Closed',
            style: TextStyle(color: col1 ? AppSettings.primaryColor : Color(0xffFF002E), fontWeight: col1 ? FontWeight.bold : FontWeight.normal),
          ),
        ),
      )),
      DataCell(InkWell(
        onTap: () {
          if (col2) open(context, Address(date: headers[i], time: time, total: widget.total));
        },
        child: Center(
          child: Text(
            col2 ? '○' : 'Closed',
            style: TextStyle(color: col2 ? AppSettings.primaryColor : Color(0xffFF002E), fontWeight: col2 ? FontWeight.bold : FontWeight.normal),
          ),
        ),
      )),
      DataCell(InkWell(
        onTap: () {
          if (col3) open(context, Address(date: headers[i], time: time, total: widget.total));
        },
        child: Center(
          child: Text(
            col3 ? '○' : 'Closed',
            style: TextStyle(color: col3 ? AppSettings.primaryColor : Color(0xffFF002E), fontWeight: col3 ? FontWeight.bold : FontWeight.normal),
          ),
        ),
      )),
    ]);
  }
}
