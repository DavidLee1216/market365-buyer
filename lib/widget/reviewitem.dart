import 'package:buyer/models/review.dart';
import 'package:buyer/services/poducts_service.dart';
import 'package:buyer/widget/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReviewItem extends StatelessWidget {
  final Review review;
  final bool showDelete;

  ReviewItem({this.review, this.showDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 10, bottom: 15),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(DateFormat.yMMMd().add_jm().format(review.postingDate.toDate()))),
                Visibility(
                    visible: showDelete != null && showDelete,
                    child: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          deleteReview(review);
                        })),
              ],
            ),
            review.imageUrls != null && review.imageUrls.isNotEmpty
                ? Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    height: 170,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: review.imageUrls.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: CachedImage(rounded: false, height: 150, url: review.imageUrls[i]),
                          );
                        }),
                  )
                : Container(),
            Text(review.content),
          ],
        ));
  }
}
