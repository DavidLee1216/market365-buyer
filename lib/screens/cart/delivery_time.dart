import 'package:buyer/screens/cart/address.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/widget/custom_button.dart';
import 'package:flutter/material.dart';

class DeliveryTime extends StatefulWidget {
  @override
  _DeliveryTimeState createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Delivery Time',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Cheongju Market',
              textScaleFactor: 1.5,
            ),
            Expanded(
              child: DataTable(
                dividerThickness: 0,
                columnSpacing: 20.0,
                columns: [
                  DataColumn(label: Text('Delivery Time')),
                  DataColumn(label: Text('10/25')),
                  DataColumn(label: Text('10/26')),
                  DataColumn(label: Text('10/27')),
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
            ),
            CustomButton(
              text: 'Next',
              showShadow: false,
              function: () {
                open(context, Address());
              },
            ),
          ],
        ),
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
        style: TextStyle(color: col1 == 'Open' ? AppSettings.primaryColor : Color(0xffFF002E)),
      )),
      DataCell(Text(
        col2,
        style: TextStyle(color: col1 == 'Open' ? AppSettings.primaryColor : Color(0xffFF002E)),
      )),
      DataCell(Text(
        col3,
        style: TextStyle(color: col1 == 'Open' ? AppSettings.primaryColor : Color(0xffFF002E)),
      )),
    ]);
  }
}
