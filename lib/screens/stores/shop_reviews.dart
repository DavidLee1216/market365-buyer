import 'package:buyer/models/review.dart';
import 'package:buyer/screens/stores/post_review.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/widget/custom_button.dart';
import 'package:buyer/widget/reviewitem.dart';
import 'package:flutter/material.dart';

class ShopReview extends StatefulWidget {
  List<Review> reviewItems = [

    Review(
      title: 'ID',
      date: '2020.10.10',
      review:
          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.',
    ),
    Review(
      title: 'ID',
      date: '2020.10.10',
      review:
          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.',

    ),
    Review(
      title: 'ID',
      date: '2020.10.10',

      review:
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.',

    ),
    Review(
      title: 'ID',
      date: '2020.10.10',
      review:
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.',


    ), Review(
      title: 'ID',
      date: '2020.10.10',
      review:
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.',

    ),

  ];

  @override
  _ShopReviewState createState() => _ShopReviewState();
}

class _ShopReviewState extends State<ShopReview> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Text('5 Reviews',
                      textScaleFactor: 1.3,
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(
                child: CustomButton(
                  text: 'Write Review',
                  showShadow: false,
                  function: () {
                    open(context, PostReview());
                  },
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, i) {
                return ReviewItem(
                  reviewItems: widget.reviewItems[i],
                  showDelete: false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
