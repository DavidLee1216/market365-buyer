import 'package:buyer/models/cart.dart';
import 'package:buyer/screens/cart/delivery_time.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/widget/cart_item.dart';
import 'package:buyer/widget/custom_button.dart';
import 'package:flutter/material.dart';

class ViewCart extends StatefulWidget {
  @override
  _ViewCartState createState() => _ViewCartState();
}

class _ViewCartState extends State<ViewCart> {
  List<Cart> cartItems = [
    Cart(store: 'My Town Meat', name: 'Samgyeopsal 200g', quantity: 2, price: 20, total: 20000),
    //Cart(store: 'My Town Fruit', name: 'Tomato 500g', quantity: 2, total: 20000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, i) {
                  return CartItem(cart: cartItems[i]);
                },
                itemCount: cartItems.length,
              ),
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
            CustomButton(
              text: 'Order',
              showShadow: false,
              function: () {
                open(context, DeliveryTime());
              },
            ),
          ],
        ),
      ),
    );
  }
}
