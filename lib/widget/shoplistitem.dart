import 'package:buyer/models/shoplist.dart';
import 'package:flutter/material.dart';

class ShopListItem extends StatelessWidget {
  final ShopList shopList;
  ShopListItem({this.shopList});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200)
      ),
      child: ListTile(
        onTap: () {
          //   open(context, NotesSelected(notice: noticeItems[i],));
        },
        dense: true,
        title: Text(shopList.name),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              shopList.address,
              style: TextStyle(color: Color(0xff585858)),
            ),
            Text(
              shopList.reviews,
              style: TextStyle(color: Color(0xff585858)),
            ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}
