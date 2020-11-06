import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:flutter/material.dart';

class DeliveryTimeNotice extends StatefulWidget {
  @override
  _DeliveryTimeNoticeState createState() => _DeliveryTimeNoticeState();
}

class _DeliveryTimeNoticeState extends State<DeliveryTimeNotice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            close(context);
          },
        ),
        title: Text(
          'Available Delivery Time Notice',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'Cheongju Market',
              textScaleFactor: 1.5,
            ),
          ),
          DataTable(
            dividerThickness: 0,
            columnSpacing: 30.0,
            columns: [
              DataColumn(label: Text('Delivery Time')),
              DataColumn(label: Text('10/25')),
              DataColumn(
                  label: Text(
                '10/26',
              )),
              DataColumn(
                  label: Text(
                '10/27',
              )),
            ],
            rows: [
              myDataRow('Closed', 'Closed', 'Closed', '9:30'),
              myDataRow('Closed', 'Closed', 'Open', '11:00'),
              myDataRow('Open', 'Open', 'Open', '12:30'),
              myDataRow('Open', 'Open', 'Open', '13:30'),
              myDataRow('Closed', 'Closed', 'Closed', '15:00'),
              myDataRow('Closed', 'Open', 'Open', '16:00'),
              myDataRow('Closed', 'Closed', 'Closed', '17:00'),
              myDataRow('Closed', 'Closed', 'Closed', '18:00'),
            ],
          ),
        ],
      ),
    );
  }

  myDataRow(String col1, String col2, String col3, String time) {
    return DataRow(cells: [
      DataCell(Center(
        child: Text(time, style: TextStyle(fontWeight: FontWeight.bold)),
      )),
      DataCell(Text(
        col1,
        style: TextStyle(
            color:
                col1 == 'Open' ? AppSettings.primaryColor : Color(0xffFF002E)),
      )),
      DataCell(Text(
        col2,
        style: TextStyle(
            color:
                col1 == 'Open' ? AppSettings.primaryColor : Color(0xffFF002E)),
      )),
      DataCell(Text(
        col3,
        style: TextStyle(
            color:
                col1 == 'Open' ? AppSettings.primaryColor : Color(0xffFF002E)),
      )),
    ]);
  }
}
