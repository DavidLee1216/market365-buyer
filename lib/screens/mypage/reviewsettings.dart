import 'package:buyer/models/review.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/widget/reviewitem.dart';
import 'package:flutter/material.dart';

class ReviewSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Review> reviewItems = [
      Review(
        title: 'My Town Meat',
        date: '2020.10.10',
        review:
            'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.',
      ),
      Review(
        title: 'My Town Meat',
        date: '2020.10.10',
        review:
            'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.',
        images: [
          'https://cdn.pixabay.com/photo/2017/01/31/09/30/raspberry-2023404__480.jpg',
          'https://cdn.pixabay.com/photo/2017/01/31/09/30/raspberry-2023404__480.jpg'
        ],
      ),
      Review(
        title: 'My Town Meat',
        date: '2020.10.10',
        review:
            'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.',
        images: [
          'https://cdn.pixabay.com/photo/2017/01/31/09/30/raspberry-2023404__480.jpg',
          'https://cdn.pixabay.com/photo/2017/01/31/09/30/raspberry-2023404__480.jpg'
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Review Settings',
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            close(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Text('4 Reviews'),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, i) {
                return ReviewItem(
                  reviewItems: reviewItems[i],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
