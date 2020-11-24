import 'package:buyer/models/event.dart';
import 'package:buyer/widget/cached_image.dart';
import 'package:flutter/material.dart';

class EventDetails extends StatelessWidget {
  final Event event;

  EventDetails({this.event});

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
      body: CachedImage(
        url: event.imageUrl,
        rounded: false,
        height: double.infinity,
      ),
    );
  }
}
