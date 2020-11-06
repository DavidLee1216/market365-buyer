import 'package:buyer/models/product.dart';
import 'package:buyer/screens/home/market/view_product.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/widget/cached_image.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => open(context, ViewProduct(product: product)),
      child: Column(
        children: [
          Expanded(child: CachedImage(rounded: false, height: double.infinity, url: product.image)),
          SizedBox(height: 10),
          Text(product.title),
        ],
      ),
    );
  }
}
