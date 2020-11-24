import 'package:buyer/screens/cart/delivery_time.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/widget/cart_item.dart';
import 'package:buyer/widget/custom_button.dart';
import 'package:buyer/widget/empty_box.dart';
import 'package:flutter/material.dart';

class ViewCart extends StatefulWidget {
  @override
  _ViewCartState createState() => _ViewCartState();
}

class _ViewCartState extends State<ViewCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: cart.isNotEmpty
          ? Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, i) {
                        return CartItem(i: i);
                      },
                      itemCount: cart.length,
                    ),
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text('Product', style: TextStyle(fontWeight: FontWeight.bold)),
                    trailing: Text('${getTotal()} 원', style: TextStyle(fontWeight: FontWeight.bold)),
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
                    trailing: Text('${getTotal() + 2000} 원', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  CustomButton(
                    text: 'Order',
                    showShadow: false,
                    function: () {
                      open(context, DeliveryTime(total: getTotal()));
                    },
                  ),
                ],
              ),
            )
          : EmptyBox(text: 'Nothing in cart. Start adding items'),
    );
  }

  getTotal() {
    num finalTotal = 0;
    num extra = 0;

    for (int j = 0; j < cart.length; j++) {
      for (int i = 0; i < cart[j].extras.length; i++) {
        if (cart[j].extras[i].selected) extra = extra + cart[j].extras[i].value;
      }
      extra = extra * cart[j].quantity;
      finalTotal = finalTotal + cart[j].price * cart[j].quantity + extra;
    }

    return finalTotal;
  }
}
