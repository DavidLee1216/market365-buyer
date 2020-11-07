import 'package:buyer/models/shop.dart';
import 'package:flutter/material.dart';

class StoreInfo extends StatelessWidget {
  final Shop shop;

  StoreInfo({this.shop});

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
            trailing: Text(shop.openTime),
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text('Closed Day'),
            trailing: Text(shop.closeDay),
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text('Telephone'),
            trailing: Text(shop.telephone),
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
            title: Text(shop.name),
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text(shop.address),
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text(shop.taxID),
          ),
        ],
      ),
    );
  }
}
