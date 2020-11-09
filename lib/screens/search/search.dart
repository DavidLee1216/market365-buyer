import 'package:buyer/models/product.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/widget/product_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Product> products = [
    Product(image: 'https://cdn.pixabay.com/photo/2014/10/19/20/59/hamburger-494706__480.jpg', title: 'Hamburger'),
    Product(image: 'https://cdn.pixabay.com/photo/2014/10/19/20/59/hamburger-494706__480.jpg', title: 'Hamburger'),
    Product(image: 'https://cdn.pixabay.com/photo/2014/10/19/20/59/hamburger-494706__480.jpg', title: 'Hamburger'),
    Product(image: 'https://cdn.pixabay.com/photo/2014/10/19/20/59/hamburger-494706__480.jpg', title: 'Hamburger'),
    Product(image: 'https://cdn.pixabay.com/photo/2014/10/19/20/59/hamburger-494706__480.jpg', title: 'Hamburger'),
    Product(image: 'https://cdn.pixabay.com/photo/2014/10/19/20/59/hamburger-494706__480.jpg', title: 'Hamburger'),
    Product(image: 'https://cdn.pixabay.com/photo/2014/10/19/20/59/hamburger-494706__480.jpg', title: 'Hamburger'),
    Product(image: 'https://cdn.pixabay.com/photo/2014/10/19/20/59/hamburger-494706__480.jpg', title: 'Hamburger'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_rounded,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), border: Border.all(color: AppSettings.primaryColor)),
            child: TextFormField(
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: AppSettings.primaryColor,
                  ),
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.black, fontSize: 15)),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 0.90),
              padding: EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductItem(product: products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
