import 'package:buyer/models/event.dart';
import 'package:buyer/screens/home/event/event_details.dart';
import 'package:buyer/services/event_service.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/utils/uatheme.dart';
import 'package:buyer/widget/cached_image.dart';
import 'package:buyer/widget/empty_box.dart';
import 'package:buyer/widget/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getEvents(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData)
          return snapshot.data.docs.isNotEmpty
              ? ListView.builder(
                  padding: EdgeInsets.all(10),
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () => open(context, EventDetails(event: Event.fromDocument(snapshot.data.docs[i]))),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: CachedImage(rounded: false, url: Event.fromDocument(snapshot.data.docs[i]).imageUrl, height: UATheme.screenWidth),
                      ),
                    );
                  },
                )
              : EmptyBox(text: 'Nothing to show');
        else
          return LoadingData();
      },
    );
  }
}
