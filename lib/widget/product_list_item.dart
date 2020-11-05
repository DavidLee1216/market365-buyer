import 'package:buyer/models/search_product.dart';
import 'package:buyer/widget/cached_image.dart';
import 'package:flutter/material.dart';

class SearchProductListItem extends StatelessWidget {
  final SearchProduct searchProductList;

  SearchProductListItem({this.searchProductList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedImage(rounded: false, height: 180, url: searchProductList.image),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            searchProductList.title,
          ),
        ),
      ],
    );
  }
}
