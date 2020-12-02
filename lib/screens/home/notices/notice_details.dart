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
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 20,
      ),
      child: Scaffold(
        appBar: AppBar(
            title: Text(
          '공지사항',
          style: TextStyle(fontWeight: FontWeight.w700),
        )),
        body: Column(
          children: [
            ListTile(
              title: Text(
                widget.announcement.title,
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                  DateFormat.yMMMd()
                      .add_jm()
                      .format(widget.announcement.postingDate.toDate()),
                  textScaleFactor: 1,
                  style: TextStyle(color: Color(0xff585858))),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(widget.announcement.content),
            )
          ],
        ),
      ),
    );
  }
}
