import 'package:buyer/models/announcement.dart';
import 'package:buyer/screens/home/notices/notice_details.dart';
import 'package:buyer/services/announcement_service.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/widget/empty_box.dart';
import 'package:buyer/widget/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Notices extends StatefulWidget {
  @override
  _NoticesState createState() => _NoticesState();
}

class _NoticesState extends State<Notices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notices'),
      ),
      body: FutureBuilder(
        future: getAnnouncements(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData)
            return snapshot.data.docs.isNotEmpty
                ? ListView.builder(
                    padding: EdgeInsets.all(10),
                    shrinkWrap: true,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, i) {
                      Announcement announcement = Announcement.fromDocument(snapshot.data.docs[i]);
                      return ListTile(
                        onTap: () => open(context, NoticeDetails(announcement: announcement)),
                        title: Text(announcement.title, textScaleFactor: 0.9),
                        subtitle: Text(DateFormat.yMMMd().add_jm().format(announcement.postingDate.toDate()), textScaleFactor: 0.8, style: TextStyle(color: Color(0xff585858))),
                      );
                    },
                  )
                : EmptyBox(text: 'Nothing to show');
          else
            return LoadingData();
        },
      ),
    );
  }
}
