import 'package:buyer/models/order.dart';
import 'package:buyer/widget/order_item.dart';
import 'package:flutter/material.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  List<Order> orders = [
    Order(name: 'My Town Meat', address: 'Samgyeopsal 200g, Bulgogi...', date: '2020.10.25', paymentMethod: 'Credit Card', total: 20000),
    Order(name: 'My Town Meat', address: 'Samgyeopsal 200g, Bulgogi...', date: '2020.10.25', paymentMethod: 'Credit Card', total: 20000),
    Order(name: 'My Town Meat', address: 'Samgyeopsal 200g, Bulgogi...', date: '2020.10.25', paymentMethod: 'Credit Card', total: 20000),
    Order(name: 'My Town Meat', address: 'Samgyeopsal 200g, Bulgogi...', date: '2020.10.25', paymentMethod: 'Credit Card', total: 20000),
    Order(name: 'My Town Meat', address: 'Samgyeopsal 200g, Bulgogi...', date: '2020.10.25', paymentMethod: 'Credit Card', total: 20000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order History')),
      body: ListView.builder(
        padding: EdgeInsets.all(15),
        itemBuilder: (context, i) {
          return OrderItem(order: orders[i]);
        },
        itemCount: orders.length,
      ),
    );
  }
}
