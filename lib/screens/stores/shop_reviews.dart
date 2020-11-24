import 'package:buyer/models/review.dart';
import 'package:buyer/screens/stores/post_store_review.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/services/store_servic.dart';
import 'package:buyer/widget/custom_button.dart';
import 'package:buyer/widget/empty_box.dart';
import 'package:buyer/widget/loading.dart';
import 'package:buyer/widget/reviewitem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShopReview extends StatefulWidget {
  final String storeID;
  final num reviews;

  ShopReview({this.storeID, this.reviews});

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
              Expanded(flex: 2, child: Text('${widget.reviews} Reviews', textScaleFactor: 1.3, style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(
                child: CustomButton(
                  text: 'Write Review',
                  showShadow: false,
                  function: () {
                    open(context, PostStoreReview(storeID: widget.storeID));
                  },
                ),
              )
            ],
          ),
          Expanded(
            child: FutureBuilder(
              future: getStoreReviews(widget.storeID),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData)
                  return snapshot.data.docs.isNotEmpty
                      ? ListView.builder(
                          padding: EdgeInsets.all(15),
                          itemBuilder: (context, i) {
                            Review order = Review.fromDocument(snapshot.data.docs[i]);
                            return ReviewItem(reviewItems: order);
                          },
                          itemCount: snapshot.data.docs.length,
                        )
                      : EmptyBox(text: 'Nothing to show');
                else
                  return LoadingData();
              },
            ),
          ),
        ],
      ),
    );
  }
}
