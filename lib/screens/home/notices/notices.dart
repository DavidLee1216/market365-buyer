import 'package:buyer/models/notice.dart';
import 'package:buyer/screens/home/notices/notice_details.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:flutter/material.dart';

class Notices extends StatefulWidget {
  @override
  _NoticesState createState() => _NoticesState();
}

class _NoticesState extends State<Notices> {
  List<Notice> noticeItems = [Notice(date: '2020.09.22', title: 'Delivery Time Change Notice'), Notice(date: '2020.09.22', title: 'Delivery Time Change Notice'), Notice(date: '2020.09.22', title: 'Delivery Time Change Notice')];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, i) {
        return ListTile(
          onTap: () => open(context, NoticeDetails(notice: noticeItems[i])),
          title: Text(noticeItems[i].title, textScaleFactor: 0.9),
          subtitle: Text(noticeItems[i].date, textScaleFactor: 0.8, style: TextStyle(color: Color(0xff585858))),
        );
      },
    );
  }

  fullBody() {
    return Scaffold(
      appBar: AppBar(title: Text('Notice')),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, i) {
          return ListTile(
            onTap: () => open(context, NoticeDetails(notice: noticeItems[i])),
            title: Text(noticeItems[i].title, textScaleFactor: 0.9),
            subtitle: Text(noticeItems[i].date, textScaleFactor: 0.8, style: TextStyle(color: Color(0xff585858))),
          );
        },
      ),
    );
  }
}
