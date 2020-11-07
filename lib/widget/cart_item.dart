import 'package:buyer/models/cart.dart';
import 'package:buyer/widget/counter.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final Cart cart;

  CartItem({this.cart});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        children: [
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text(cart.store, textScaleFactor: 1.5, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text(cart.name, style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text(cart.price.toString() + ' 원'),
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text('Roast', style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text('+0 원'),
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Counter(
              initialValue: 0,
              minValue: 0,
              maxValue: 10,
              step: 0.5,
              decimalPlaces: 0,
              onChanged: (value) {
                // get the latest value from here
              },
            ),
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text(cart.total.toString() + ' 원', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
