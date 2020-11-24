import 'package:buyer/models/store.dart';
import 'package:flutter/material.dart';

class StoreInfo extends StatelessWidget {
  final Store store;

  StoreInfo({this.store});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text('Information', textScaleFactor: 1.2, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text('Open/Closed'),
            trailing: Text(store.openHour.toString() + " - " + store.closeHour.toString()),
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text('Closed Day'),
            trailing: Text(store.closeDays.toString()),
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text('Telephone'),
            trailing: Text(store.tel),
          ),
          Divider(height: 25, thickness: 2, color: Colors.grey.shade200),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text('Store Information', textScaleFactor: 1.2, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text(store.name),
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text(store.address),
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text(store.taxId),
          ),
        ],
      ),
    );
  }
}
