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
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 20,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '리뷰관리',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              close(context);
            },
          ),
        ),
        body: StreamBuilder(
          stream: getMyStoreReviews(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData)
              return snapshot.data.docs.isNotEmpty
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                              snapshot.data.docs.length.toString() + " Reviews",
                              textScaleFactor: 1.2),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.all(15),
                            itemBuilder: (context, i) {
                              Review order =
                                  Review.fromDocument(snapshot.data.docs[i]);
                              return ReviewItem(
                                  review: order, showDelete: true);
                            },
                            itemCount: snapshot.data.docs.length,
                          ),
                        ),
                      ],
                    )
                  : EmptyBox(text: 'Nothing to show');
            else
              return LoadingData();
          },
        ),
      ),
    );
  }
}
