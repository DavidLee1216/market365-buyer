import 'package:buyer/models/review.dart';
import 'package:buyer/widget/cached_image.dart';
import 'package:flutter/material.dart';

class ReviewItem extends StatelessWidget {
  final Review reviewItems;
  ReviewItem({this.reviewItems});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 10, bottom: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade200)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(reviewItems.title),
                Text(reviewItems.date),
                IconButton(icon: Icon(Icons.delete), onPressed: () {})
              ],
            ),
            reviewItems.images != null && reviewItems.images.isNotEmpty
                ? Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    height: 170,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: reviewItems.images.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: CachedImage(
                                rounded: false, height: 150, url: reviewItems.images[i]),
                          );
                        }),
                  )
                : Container(),
            Text(reviewItems.review),
          ],
        ));
  }
}
