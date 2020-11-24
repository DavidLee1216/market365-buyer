import 'package:buyer/models/review.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/services/store_servic.dart';
import 'package:buyer/widget/empty_box.dart';
import 'package:buyer/widget/loading.dart';
import 'package:buyer/widget/reviewitem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReviewSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: FutureBuilder(
              future: getMyStoreReviews(),
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
