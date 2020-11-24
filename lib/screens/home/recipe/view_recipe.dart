import 'package:buyer/models/product.dart';
import 'package:buyer/models/recipe.dart';
import 'package:buyer/screens/stores/product_details.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/services/poducts_service.dart';
import 'package:buyer/widget/cached_image.dart';
import 'package:buyer/widget/loading.dart';
import 'package:flutter/material.dart';

class ViewRecipe extends StatelessWidget {
  final Recipe recipe;

  ViewRecipe({this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedImage(rounded: false, url: recipe.imageUrl),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(recipe.content),
            ),
            // Container(
            //   width: double.infinity,
            //   child: FittedBox(
            //       child: CachedImage(
            //         rounded: false,
            //         url: 'https://cdn.pixabay.com/photo/2014/08/14/14/21/shish-kebab-417994__480.jpg',
            //       ),
            //       fit: BoxFit.cover),
            // ),

            FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Product product = Product.fromDocument(snapshot.data);
                  return ListTile(
                    onTap: () async {
                      open(context, ProductDetails(product: product));
                    },
                    title: Text(recipe.title),
                    subtitle: Text(product.price.toString() + ' 원', style: TextStyle(color: Colors.grey)),
                  );
                } else
                  return LoadingData();
              },
              future: getProduct(recipe.productID),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 20),
              child: Text(
                'Photos may be different from the actual cooked food',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
