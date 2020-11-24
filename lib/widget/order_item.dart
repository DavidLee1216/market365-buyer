import 'package:buyer/models/order.dart';
import 'package:buyer/screens/orders/order_details.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  final Order order;

  OrderItem({this.order});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        open(context, OrderDetails(order: order));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200)),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Text(order.name, textScaleFactor: 1.2, style: TextStyle(fontWeight: FontWeight.bold))),
                Text(DateFormat.yMMMd().add_jm().format(order.date.toDate()), style: TextStyle(color: Colors.grey.shade400)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: Text(order.address)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: Text('Payment Method')),
                Text(order.payment, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: Text('Total')),
                Text((order.total).toString() + '원', style: TextStyle(fontWeight: FontWeight.bold, color: AppSettings.primaryColor)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
