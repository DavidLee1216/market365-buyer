import 'package:buyer/widget/cached_image.dart';
import 'package:flutter/material.dart';

class Excepteur extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Budaejjigae'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: double.infinity,
            child: FittedBox(
                child: CachedImage(
                  rounded: false,
                  url:
                      'https://cdn.pixabay.com/photo/2014/08/14/14/21/shish-kebab-417994__480.jpg',
                ),
                fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.',
                  ),
                  TextSpan(
                    text:
                        ' Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis.',
                  ),
                  TextSpan(
                      text:
                          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede'),
                  TextSpan(
                      text:
                          '  Morbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod in, pharetra a, ultricies in, diam. Sed arcu. Cras consequat.!'),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: FittedBox(
                child: CachedImage(
                  rounded: false,
                  url:
                      'https://cdn.pixabay.com/photo/2014/08/14/14/21/shish-kebab-417994__480.jpg',
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
            padding: const EdgeInsets.only(top:30,left: 10,right: 10,bottom: 20),
            child: Text('Photos may be different from the actual cooked food',style: TextStyle(color: Colors.grey),),
          )
        ]),
      ),
    );
  }
}
