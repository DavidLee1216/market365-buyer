import 'package:buyer/models/announcement.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoticeDetails extends StatefulWidget {
  final Announcement announcement;

  NoticeDetails({this.announcement});

  @override
  _NoticeDetailsState createState() => _NoticeDetailsState();
}

class _NoticeDetailsState extends State<NoticeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notice')),
      body: Column(
        children: [
          ListTile(
            title: Text(widget.announcement.title),
            subtitle: Text(DateFormat.yMMMd().add_jm().format(widget.announcement.postingDate.toDate()), textScaleFactor: 0.8, style: TextStyle(color: Color(0xff585858))),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(widget.announcement.content),
          )
        ],
      ),
    );
  }
}
