import 'package:buyer/models/cart.dart';
import 'package:buyer/models/extras.dart';
import 'package:buyer/models/product.dart';
import 'package:buyer/services/poducts_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:flutter/material.dart';

import 'counter.dart';

class CartItem extends StatefulWidget {
  final CartProducts cartProduct;

  CartItem({this.cartProduct});

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  List<Extras> extras = List();

  @override
  void initState() {
    //for (int i = 0; i < cart[widget.i].extras.length; i++) if (cart[widget.i].extras[i].selected) extras.add(cart[widget.i].extras[i]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Product product = Product.fromDocument(snapshot.data);
          return product != null && product.price > 0
              ? Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade200)),
                  child: Column(
                    children: [
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(product.title,
                            textScaleFactor: 1.5,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(product.title,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        trailing: Text(product.price.toString() + ' 원'),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: widget.cartProduct.options.length,
                          itemBuilder: (context, i) {
                            return ListTile(
                              dense: true,
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                  widget.cartProduct.options.keys.toList()[i],
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              trailing: Text(
                                  '+ ${widget.cartProduct.options.values.toList()[i]} 원'),
                            );
                          }),
                      Divider(color: Colors.grey.shade400),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('수량'),
                          Counter(
                            initialValue: widget.cartProduct.quantity,
                            minValue: 0,
                            maxValue: 1000,
                            step: 1,
                            decimalPlaces: 0,
                            onChanged: (value) {
                              setState(() {
                                widget.cartProduct.quantity = value;
                              });
                            },
                          ),
                        ],
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text('금액',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        trailing: Text(
                            getTotal(product.price).toString() + ' 원',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                )
              : Container();
        } else {
          return Container();
        }
      },
      future: getProduct(widget.cartProduct.productID),
    );
  }

  getTotal(num price) {
    print('CALLED');
    num extras = 0;
    for (int i = 0; i < widget.cartProduct.options.length; i++) {
      extras = extras + widget.cartProduct.options.values.toList()[i];
    }

    AppSettings.cartTotal =
        AppSettings.cartTotal + (extras + price) * widget.cartProduct.quantity;
    return (extras + price) * widget.cartProduct.quantity;
  }
}
