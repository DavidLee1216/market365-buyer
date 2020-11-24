import 'package:buyer/models/timetable.dart';
import 'package:buyer/services/market_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/widget/empty_box.dart';
import 'package:buyer/widget/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AvailableDeliveryTimes extends StatefulWidget {
  @override
  _AvailableDeliveryTimesState createState() => _AvailableDeliveryTimesState();
}

class _AvailableDeliveryTimesState extends State<AvailableDeliveryTimes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Available Delivery Time',
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
                  List<String> headers = timeTable.delivery.keys.toList()..sort();

                  Map map1 = timeTable.delivery[headers[0]];
                  Map map2 = timeTable.delivery[headers[1]];
                  Map map3 = timeTable.delivery[headers[2]];
                  List<String> keys = map2.keys.toList()..sort();
                  for (int i = 0; i < map1.keys.toList().length; i++) {
                    String key = keys[i];
                    rows.add(
                      myDataRow(map1[key], map2[key], map3[key], key),
                    );
                  }
                  return DataTable(
                    dividerThickness: 0,
                    columnSpacing: 20.0,
                    columns: [
                      DataColumn(label: Text('Delivery Time')),
                      DataColumn(label: Text(headers[0])),
                      DataColumn(label: Text(headers[1])),
                      DataColumn(label: Text(headers[2])),
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

  myDataRow(bool col1, bool col2, bool col3, String time) {
    return DataRow(cells: [
      DataCell(Center(
        child: Text(time, style: TextStyle(fontWeight: FontWeight.bold)),
      )),
      DataCell(Text(
        col1 ? 'Open' : 'Closed',
        style: TextStyle(color: col1 ? AppSettings.primaryColor : Color(0xffFF002E)),
      )),
      DataCell(Text(
        col2 ? 'Open' : 'Closed',
        style: TextStyle(color: col2 ? AppSettings.primaryColor : Color(0xffFF002E)),
      )),
      DataCell(Text(
        col3 ? 'Open' : 'Closed',
        style: TextStyle(color: col3 ? AppSettings.primaryColor : Color(0xffFF002E)),
      )),
    ]);
  }
}
