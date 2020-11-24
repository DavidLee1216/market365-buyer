import 'package:buyer/models/extras.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  final int i;

  CartItem({this.i});

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  List<Extras> extras = List();

  @override
  void initState() {
    for (int i = 0; i < cart[widget.i].extras.length; i++) if (cart[widget.i].extras[i].selected) extras.add(cart[widget.i].extras[i]);
    super.initState();
  }

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
            title: Text(cart[widget.i].stores[0], textScaleFactor: 1.5, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text(cart[widget.i].title, style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text(cart[widget.i].price.toString() + ' 원'),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: extras.length,
              itemBuilder: (context, i) {
                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text(cart[widget.i].extras[i].key, style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Text('+ ${cart[widget.i].extras[i].value} 원'),
                );
              }),
          Divider(color: Colors.grey.shade400),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold)),
            // trailing: Counter(
            //   initialValue: cart[widget.i].quantity,
            //   minValue: 0,
            //   maxValue: 10,
            //   decimalPlaces: 0,
            //   onChanged: (value) {
            //     setState(() {
            //       cart[widget.i].quantity = value;
            //     });
            //   },
            // ),
            trailing: Text('X ' + cart[widget.i].quantity.toString()),
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text(getTotal().toString() + ' 원', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  getTotal() {
    num extra = 0;
    for (int i = 0; i < extras.length; i++) {
      extra = extra + extras[i].value;
    }

    extra = extra * cart[widget.i].quantity;
    return extra + cart[widget.i].price * cart[widget.i].quantity;
  }
}
