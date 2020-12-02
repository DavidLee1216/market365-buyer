import 'dart:async';

import 'package:buyer/models/cart.dart';
import 'package:buyer/screens/cart/delivery_time.dart';
import 'package:buyer/services/cart_service.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/widget/cart_item.dart';
import 'package:buyer/widget/custom_button.dart';
import 'package:buyer/widget/empty_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewCart extends StatefulWidget {
  @override
  _ViewCartState createState() => _ViewCartState();
}

class _ViewCartState extends State<ViewCart> {
  startTimeout() async {
    var duration = const Duration(seconds: 1);
    return new Timer(duration, handleTimeout);
  }

  void handleTimeout() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    AppSettings.cartTotal = 0;
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('장바구니'),
        actions: [
          FlatButton(
              onPressed: () async {
                await clearCart();
              },
              child: Text('Clear'))
        ],
      ),
      body: StreamBuilder(
        stream: getCartItems(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            Cart cart = Cart.fromDocument(snapshot.data);
            return cart != null
                ? Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, i) {
                              return CartItem(cartProduct: cart.products[i]);
                            },
                            itemCount: cart.products.length,
                          ),
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: Text('Product',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          trailing: Text('${AppSettings.cartTotal} 원',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: Text('Delivery Fee',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          trailing: Text('${AppSettings.deliveryFee} 원',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: Text('Total',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          trailing: Text(
                              '${AppSettings.cartTotal + AppSettings.deliveryFee} 원',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        CustomButton(
                          text: 'Order',
                          showShadow: false,
                          function: () {
                            open(
                                context,
                                DeliveryTime(
                                    total: AppSettings.cartTotal +
                                        AppSettings.deliveryFee));
                          },
                        ),
                      ],
                    ),
                  )
                : EmptyBox(text: 'Nothing in cart. Start adding items');
          } else
            return EmptyBox(text: 'Nothing in cart. Start adding items');
        },
      ),
    );
  }
}
