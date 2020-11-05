import 'package:buyer/models/notice_model.dart';
import 'package:buyer/screens/notes/notes_selected.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  List<Notice> noticeItems = [Notice(date: '2020.09.22', title: 'Delivery Time Change Notice'), Notice(date: '2020.09.22', title: 'Delivery Time Change Notice'), Notice(date: '2020.09.22', title: 'Delivery Time Change Notice')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text(
          'Notice',
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, i) {
              return ListTile(
                onTap: () {
                  open(
                      context,
                      NotesSelected(
                        notice: noticeItems[i],
                      ));
                },
                title: Text(noticeItems[i].title),
                subtitle: Text(
                  noticeItems[i].date,
                  style: TextStyle(color: Color(0xff585858)),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
