import 'package:buyer/widget/cached_image.dart';
import 'package:flutter/material.dart';

class Event_Select extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Event'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
      height: double.infinity,
    width: double.infinity,
    child: FittedBox(child: CachedImage(url: 'https://media.istockphoto.com/vectors/bright-modern-mega-sale-banner-for-advertising-discounts-vector-for-vector-id1194343598',rounded: false,),
    fit: BoxFit.cover),
    ),
    );
  }
}
