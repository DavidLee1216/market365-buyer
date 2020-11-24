import 'dart:io';

import 'package:buyer/models/product.dart';
import 'package:buyer/models/review.dart';
import 'package:buyer/services/alert_service.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/services/poducts_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/widget/add_item.dart';
import 'package:buyer/widget/grid_image_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostReview extends StatefulWidget {
  final Product product;
  final String orderID;

  PostReview({this.product, this.orderID});

  @override
  _PostReviewState createState() => _PostReviewState();
}

class _PostReviewState extends State<PostReview> {
  List<String> images = List();
  List<String> imageURLs = List();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    images.add('add');
    super.initState();
  }

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
            onPressed: proceed,
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
                controller: controller,
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
            buildCoverImages(),
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

  proceed() async {
    if (images.length == 1) {
      alert('Please add at least one image');
      return;
    }
    if (controller.text.isEmpty) return;
    for (int i = 0; i < images.length; i++)
      if (images[i] != 'add') {
        String url = images[i];
        if (!images[i].startsWith('http')) url = await uploadReviewPhoto(File(images[i]));
        imageURLs.add(url);
      }

    await postReview(Review(
      active: true,
      content: controller.text,
      imageUrls: imageURLs,
      orderID: widget.orderID,
      postingDate: Timestamp.now(),
    ));
    close(context);
  }

  buildCoverImages() {
    return GridView.builder(
      padding: EdgeInsets.only(bottom: 10),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: images.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 1),
      itemBuilder: (context, i) {
        if (images[i] == 'add')
          return AddItem(pickFromCamera: () async {
            closeDialog(context);
            var pickedFile = await ImagePicker().getImage(source: ImageSource.camera, imageQuality: 65);
            images.add(pickedFile.path);
            if (images.length == 6)
              images.remove('add');
            else {
              if (!images.contains('add')) images.add('add');
            }
            setState(() {});
          }, pickFromGallery: () async {
            closeDialog(context);
            var pickedFile = await ImagePicker().getImage(source: ImageSource.gallery, imageQuality: 65);
            images.add(pickedFile.path);
            if (images.length == 6)
              images.remove('add');
            else {
              if (!images.contains('add')) images.add('add');
            }
            setState(() {});
          });
        else
          return GridImageItem(
              image: images[i],
              removeImage: () async {
                images.removeAt(i);
                if (images.length == 6)
                  images.remove('add');
                else {
                  if (!images.contains('add')) images.add('add');
                }
                setState(() {});
              });
      },
    );
  }
}
