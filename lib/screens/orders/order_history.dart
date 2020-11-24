import 'package:buyer/models/order.dart';
import 'package:buyer/services/order_service.dart';
import 'package:buyer/widget/empty_box.dart';
import 'package:buyer/widget/loading.dart';
import 'package:buyer/widget/order_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order History')),
      body: FutureBuilder(
        future: getOrders(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data.docs.length);
            return snapshot.data.docs.isNotEmpty
                ? ListView.builder(
                    padding: EdgeInsets.all(15),
                    itemBuilder: (context, i) {
                      Order order = Order.fromDocument(snapshot.data.docs[i]);
                      return OrderItem(order: order);
                    },
                    itemCount: snapshot.data.docs.length,
                  )
                : EmptyBox(text: 'Nothing to show');
          } else
            return LoadingData();
        },
      ),
    );
  }
}
