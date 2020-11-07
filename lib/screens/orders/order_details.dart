import 'package:buyer/models/cart.dart';
import 'package:buyer/models/order.dart';
import 'package:buyer/widget/order_details_item.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  final Order order;

  OrderDetails({this.order});

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  List<Cart> cartItems = [
    Cart(store: 'My Town Meat', name: 'Samgyeopsal 200g', quantity: 2, price: 20, total: 20000),
    Cart(store: 'My Town Fruit', name: 'Tomato 500g', quantity: 2, total: 20000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order Details')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(child: Text(widget.order.name, textScaleFactor: 1.2, style: TextStyle(fontWeight: FontWeight.bold))),
                Text(widget.order.date, style: TextStyle(color: Colors.grey.shade400)),
              ],
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                return OrderDetailsItem(order: widget.order);
              },
              itemCount: cartItems.length,
            ),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: Text('Product', style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Text('20000 원', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: Text('Delivery Fee', style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Text('2000 원', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Text('22000 원', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade100,
              ),
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text('Other Information', textScaleFactor: 1.3),
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text('Payment Method'),
                    trailing: Text('Credit Card'),
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text('Name'),
                    trailing: Text('John Doe'),
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text('Payment Date'),
                    trailing: Text('10.10.2020'),
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text('Delivery Address'),
                    trailing: Text('Complete Address here'),
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text('Delivery Time'),
                    trailing: Text('12:00 - 13:00'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
