import 'package:buyer/utils/app_settings.dart';
import 'package:flutter/material.dart';

class PostReview extends StatefulWidget {
  @override
  _PostReviewState createState() => _PostReviewState();
}

class _PostReviewState extends State<PostReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(
          'Post Review',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: TextField(
                maxLength: 300,
                maxLines: 10,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: AppSettings.primaryColor)),
                ),
              ),
            ),
            Container(
              height: 80,
              width: 80,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppSettings.primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: null,
                  ),
                  Text(
                    '0/5',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Text(
              'False-written reviews notice',
              textScaleFactor: 0.9,
              style: TextStyle(
                color: Color(0xff717171),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
