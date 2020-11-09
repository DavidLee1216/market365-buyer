import 'package:buyer/models/product.dart';
import 'package:buyer/screens/stores/product_details.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/widget/cached_image.dart';
import 'package:flutter/material.dart';

class StoreProducts extends StatefulWidget {
  @override
  _StoreProductsState createState() => _StoreProductsState();
}

class _StoreProductsState extends State<StoreProducts> {
  List<Product> products = [
    Product(image: 'https://cdn.pixabay.com/photo/2017/05/07/08/56/pancakes-2291908__480.jpg', title: 'Product Title', price: 38),
    Product(image: 'https://cdn.pixabay.com/photo/2015/03/26/09/39/cupcakes-690040__480.jpg', title: 'Product Title', price: 574),
    Product(image: 'https://cdn.pixabay.com/photo/2017/07/20/18/44/dessert-2523289__480.jpg', title: 'Product Title', price: 62),
    Product(image: 'https://cdn.pixabay.com/photo/2014/08/14/14/21/shish-kebab-417994__480.jpg', title: 'Product Title', price: 62),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text('Country of Origin\n\n\n-Pork: Domestic\nBeef:Domestic, USA\n\nI will do my best!'),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            color: AppSettings.primaryColor.withAlpha(20),
            child: Column(
              children: [
                Text('Signature Menu', textScaleFactor: 1.3),
                SizedBox(height: 15),
                ListView.builder(
                    itemCount: products.length,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          onTap: () => ProductDetails(),
                          leading: CachedImage(rounded: false, height: 60, url: products[i].image),
                          title: Text(products[i].title),
                          subtitle: Text(products[i].price.toString()),
                        ),
                      );
                    }),
              ],
            ),
          ),
          ListView.builder(
              itemCount: products.length,
              padding: EdgeInsets.all(15),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: ListTile(
                    onTap: () => ProductDetails(),
                    dense: true,
                    title: Text(products[i].title, style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(products[i].price.toString()),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
