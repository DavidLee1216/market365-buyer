import 'package:buyer/models/product.dart';
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
              icon: Icon(
                Icons.shopping_cart_rounded,
                color: Colors.white,
              ),
              onPressed: null)
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
                  Container(height: UATheme.screenHeight * 0.3, child: CachedImage(rounded: true, height: double.infinity, url: widget.product.image)),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(widget.product.title, textScaleFactor: 1.2),
                    trailing: Text(widget.product.price.toString() + ' 원', textScaleFactor: 1.1, style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
                  SizedBox(height: 25),
                  Text('Use'),
                  Row(
                    children: [
                      Checkbox(materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, value: false, activeColor: Colors.green, onChanged: (bool newValue) {}),
                      Expanded(child: Text('Boiled', textScaleFactor: 0.9)),
                      Text('+ 0 원', textScaleFactor: 0.9),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, value: false, activeColor: Colors.green, onChanged: (bool newValue) {}),
                      Expanded(child: Text('Roast', textScaleFactor: 0.9)),
                      Text('+ 0 원', textScaleFactor: 0.9),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Quantity'),
                      Counter(
                        initialValue: 0,
                        minValue: 0,
                        maxValue: 10,
                        step: 0.5,
                        decimalPlaces: 0,
                        onChanged: (value) {
                          // get the latest value from here
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('Total', textScaleFactor: 1.2),
                    trailing: Text(widget.product.price.toString() + ' 원', textScaleFactor: 1.1, style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              text: 'Cart',
              showShadow: false,
            ),
          ),
        ],
      ),
    );
  }
}
