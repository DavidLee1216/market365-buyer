import 'package:buyer/models/shop.dart';
import 'package:buyer/screens/stores/store_details.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:flutter/material.dart';

class ShopItem extends StatelessWidget {
  final Shop shop;

  ShopItem({this.shop});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200)),
      child: ListTile(
        onTap: () => open(context, StoreDetails(shop: shop)),
        dense: true,
        title: Text(shop.name),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(shop.address, style: TextStyle(color: Color(0xff585858))),
            SizedBox(height: 5),
            Text(shop.reviews, style: TextStyle(color: Color(0xff585858))),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}
