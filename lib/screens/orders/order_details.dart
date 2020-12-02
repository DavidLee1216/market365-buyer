import 'package:buyer/models/order.dart';
import 'package:buyer/models/product.dart';
import 'package:buyer/services/poducts_service.dart';
import 'package:buyer/widget/order_details_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderDetails extends StatefulWidget {
  final Order order;

  OrderDetails({this.order});

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
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
                Expanded(
                    child: Text(widget.order.name,
                        textScaleFactor: 1.2,
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Text(
                    DateFormat.yMMMd()
                        .add_jm()
                        .format(widget.order.date.toDate()),
                    style: TextStyle(color: Colors.grey.shade400)),
              ],
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                return FutureBuilder(
                  future: getProduct(widget.order.products[i]['productID']),
                  builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasData)
                      return OrderDetailsItem(
                        product: Product.fromDocument(snapshot.data),
                        orderID: widget.order.orderID,
                      );
                    else
                      return Container();
                  },
                );
              },
              itemCount: 1,
            ),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: Text('상품', style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Text(widget.order.total.toString() + ' 원',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: Text('배달료', style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Text(widget.order.delivery.toString() + ' 원',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              title:
                  Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Text((widget.order.total).toString() + ' 원',
                  style: TextStyle(fontWeight: FontWeight.bold)),
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
                    trailing: Text(widget.order.payment),
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text('Name'),
                    trailing: Text(widget.order.name),
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text('Payment Date'),
                    trailing: Text(DateFormat.yMMMd()
                        .add_jm()
                        .format(widget.order.paidDate.toDate())),
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text('Delivery Address'),
                    trailing: Text(widget.order.address),
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text('배송시간'),
                    trailing: Text(DateFormat('MMM dd, yyyy ')
                            .format(widget.order.date.toDate()) +
                        widget.order.time),
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
