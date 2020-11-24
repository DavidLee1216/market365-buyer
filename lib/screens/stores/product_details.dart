import 'package:buyer/models/product.dart';
import 'package:buyer/screens/cart/view_cart.dart';
import 'package:buyer/services/alert_service.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/utils/uatheme.dart';
import 'package:buyer/widget/cached_image.dart';
import 'package:buyer/widget/counter.dart';
import 'package:buyer/widget/custom_button.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  ProductDetails({this.product});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_rounded, color: Colors.white),
            onPressed: () => open(context, ViewCart()),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: UATheme.screenHeight * 0.3, child: CachedImage(rounded: true, height: double.infinity, url: widget.product.imageUrl)),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(widget.product.title, textScaleFactor: 1.2),
                    trailing: Text(widget.product.price.toString() + ' 원', textScaleFactor: 1.1, style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Text(widget.product.description),
                  SizedBox(height: 25),
                  Text('Use'),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.product.extras.length,
                      itemBuilder: (context, i) {
                        return Row(
                          children: [
                            Checkbox(
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                value: widget.product.extras[i].selected,
                                activeColor: Colors.green,
                                onChanged: (bool newValue) {
                                  setState(() {
                                    widget.product.extras[i].selected = !widget.product.extras[i].selected;
                                  });
                                }),
                            Expanded(child: Text(widget.product.extras[i].key, textScaleFactor: 0.9)),
                            Text('+ ${widget.product.extras[i].value} 원', textScaleFactor: 0.9),
                          ],
                        );
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Quantity'),
                      Counter(
                        initialValue: widget.product.quantity,
                        minValue: 0,
                        maxValue: 10,
                        step: 1,
                        decimalPlaces: 0,
                        onChanged: (value) {
                          setState(() {
                            widget.product.quantity = value;
                          });
                        },
                      ),
                    ],
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('Total', textScaleFactor: 1.2),
                    trailing: Text(getTotal().toString() + ' 원', textScaleFactor: 1.1, style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              color: cart.contains(widget.product) ? Colors.grey : AppSettings.primaryColor,
              text: cart.contains(widget.product) ? 'Remove from cart' : 'Add to Cart',
              showShadow: false,
              function: () {
                setState(() {
                  if (cart.contains(widget.product))
                    cart.remove(widget.product);
                  else
                    cart.add(widget.product);
                  alert('Cart updated');
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  getTotal() {
    num extra = 0;
    for (int i = 0; i < widget.product.extras.length; i++) {
      if (widget.product.extras[i].selected) extra = extra + widget.product.extras[i].value;
    }

    extra = extra * widget.product.quantity;
    return extra + widget.product.price * widget.product.quantity;
  }
}
