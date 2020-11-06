import 'package:buyer/models/product.dart';
import 'package:buyer/widget/cached_image.dart';
import 'package:flutter/material.dart';

class ViewProduct extends StatelessWidget {
  final Product product;

  ViewProduct({this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Budaejjigae')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedImage(rounded: false, url: product.image),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text('Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.'),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text('Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.'),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text('Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.'),
            ),
            Container(
              width: double.infinity,
              child: FittedBox(
                  child: CachedImage(
                    rounded: false,
                    url: 'https://cdn.pixabay.com/photo/2014/08/14/14/21/shish-kebab-417994__480.jpg',
                  ),
                  fit: BoxFit.cover),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Budaejjigae Kit',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '24,500',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 20),
              child: Text(
                'Photos may be different from the actual cooked food',
                style: TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
