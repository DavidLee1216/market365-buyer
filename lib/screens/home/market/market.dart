import 'package:buyer/models/product.dart';
import 'package:buyer/widget/product_item.dart';
import 'package:flutter/material.dart';

class Market extends StatefulWidget {
  @override
  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> {
  List<Product> products = [
    Product(image: 'https://cdn.pixabay.com/photo/2017/05/07/08/56/pancakes-2291908__480.jpg', title: 'Product Title', price: 38),
    Product(image: 'https://cdn.pixabay.com/photo/2015/03/26/09/39/cupcakes-690040__480.jpg', title: 'Product Title', price: 574),
    Product(image: 'https://cdn.pixabay.com/photo/2017/07/20/18/44/dessert-2523289__480.jpg', title: 'Product Title', price: 62),
    Product(image: 'https://cdn.pixabay.com/photo/2014/08/14/14/21/shish-kebab-417994__480.jpg', title: 'Product Title', price: 62),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 0.8),
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (context, i) {
        return ProductItem(product: products[i]);
      },
    );
  }

  fullBody() {
    return Scaffold(
      appBar: AppBar(title: Text('Notice')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, i) {
          return ProductItem(product: products[i]);
        },
      ),
    );
  }
}
