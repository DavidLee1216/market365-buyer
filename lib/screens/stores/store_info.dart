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
            title: Text('영업정보',
                textScaleFactor: 1.3,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text(
              '운영시간',
              style: TextStyle(fontSize: 14),
            ),
            trailing: Text(
                store.openHour.toString() + " - " + store.closeHour.toString(),
                style: TextStyle(fontSize: 14)),
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text('휴무일', style: TextStyle(fontSize: 14)),
            trailing: Text(store.closeDays.toString(),
                style: TextStyle(fontSize: 14)),
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text('전화번호', style: TextStyle(fontSize: 14)),
            trailing: Text(store.tel, style: TextStyle(fontSize: 14)),
          ),
          Divider(height: 25, thickness: 2, color: Colors.grey.shade200),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text('사업자정보',
                textScaleFactor: 1.3,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text('대표자명', style: TextStyle(fontSize: 14)),
            trailing: Text('', style: TextStyle(fontSize: 14)),
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text('상호명', style: TextStyle(fontSize: 14)),
            trailing: Text(store.name, style: TextStyle(fontSize: 14)),
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text('사업자주소', style: TextStyle(fontSize: 14)),
            trailing: Text(store.address, style: TextStyle(fontSize: 14)),
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text('사업자 등록번호', style: TextStyle(fontSize: 14)),
            trailing: Text(store.taxId, style: TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
