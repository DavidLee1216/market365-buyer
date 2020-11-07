import 'package:buyer/models/order.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final Order order;

  OrderItem({this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text(order.name, textScaleFactor: 1.2, style: TextStyle(fontWeight: FontWeight.bold))),
              Text(order.date, style: TextStyle(color: Colors.grey.shade400)),
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
              Text(order.paymentMethod, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: Text('Total')),
              Text(order.total.toString() + '원', style: TextStyle(fontWeight: FontWeight.bold, color: AppSettings.primaryColor)),
            ],
          ),
        ],
      ),
    );
  }
}