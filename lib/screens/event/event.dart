import 'package:buyer/models/event.dart';
import 'package:buyer/screens/event/event_details.dart';
import 'package:buyer/utils/uatheme.dart';
import 'package:buyer/widget/cached_image.dart';
import 'package:flutter/material.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  List<Event> events = [
    Event(image: 'https://media.istockphoto.com/vectors/bright-modern-mega-sale-banner-for-advertising-discounts-vector-for-vector-id1194343598'),
    Event(image: 'https://media.istockphoto.com/vectors/bright-modern-mega-sale-banner-for-advertising-discounts-vector-for-vector-id1194343598'),
    Event(image: 'https://media.istockphoto.com/vectors/bright-modern-mega-sale-banner-for-advertising-discounts-vector-for-vector-id1194343598'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Event')),
      body: ListView.builder(
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () => EventDetails(event: events[i]),
            child: CachedImage(rounded: false, url: events[i].image, height: UATheme.screenWidth),
          );
        },
        itemCount: 3,
      ),
    );
  }
}
