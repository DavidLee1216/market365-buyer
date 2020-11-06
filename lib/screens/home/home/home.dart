import 'package:buyer/models/category.dart';
import 'package:buyer/models/product.dart';
import 'package:buyer/utils/uatheme.dart';
import 'package:buyer/widget/cached_image.dart';
import 'package:buyer/widget/category_item.dart';
import 'package:buyer/widget/product_item.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Category> categories = [
    Category(name: 'Category', image: ''),
    Category(name: 'Category', image: ''),
    Category(name: 'Category', image: ''),
    Category(name: 'Category', image: ''),
    Category(name: 'Category', image: ''),
    Category(name: 'Category', image: ''),
    Category(name: 'Category', image: ''),
    Category(name: 'Category', image: ''),
  ];

  List<Product> products = [
    Product(image: 'https://cdn.pixabay.com/photo/2017/05/07/08/56/pancakes-2291908__480.jpg', title: 'Product Title', price: 38),
    Product(image: 'https://cdn.pixabay.com/photo/2015/03/26/09/39/cupcakes-690040__480.jpg', title: 'Product Title', price: 574),
    Product(image: 'https://cdn.pixabay.com/photo/2014/12/11/02/55/food-563796__480.jpg', title: 'Product Title', price: 62),
    Product(image: 'https://cdn.pixabay.com/photo/2014/08/14/14/21/shish-kebab-417994__480.jpg', title: 'Product Title', price: 62),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: UATheme.screenHeight * 0.3,
            child: CachedImage(
              rounded: false,
              url: 'https://media.istockphoto.com/vectors/bright-modern-mega-sale-banner-for-advertising-discounts-vector-for-vector-id1194343598',
              height: UATheme.screenWidth,
            ),
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 1, mainAxisSpacing: 15, crossAxisSpacing: 10),
            shrinkWrap: true,
            itemCount: categories.length,
            itemBuilder: (context, i) {
              return CategoryItem(category: categories[i]);
            },
          ),
          section('Market'),
          section('BEST'),
          section('Today\'s Menu'),
        ],
      ),
    );
  }

  section(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(title, textScaleFactor: 1.4),
        ),
        Container(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(10),
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, i) {
              return Container(height: 150, width: 150, margin: EdgeInsets.only(right: 10), child: ProductItem(product: products[i]));
            },
          ),
        ),
        SizedBox(height: 25),
      ],
    );
  }
}
