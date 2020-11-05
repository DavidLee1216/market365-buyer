import 'package:buyer/models/notice_model.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:flutter/material.dart';

class NotesSelected extends StatefulWidget {
  final Notice notice;

  NotesSelected({this.notice});

  @override
  _NotesSelectedState createState() => _NotesSelectedState();
}

class _NotesSelectedState extends State<NotesSelected> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            close(context);
          },
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
        ListTile(
          onTap: () {},
          title: Text(widget.notice.title),
          subtitle: Text(
            widget.notice.date,
            style: TextStyle(color: Color(0xff585858)),
          ),
        ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
                'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.\n\nDonec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis.\n\nMorbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod in, pharetra a, ultricies in, diam. Sed arcu. Cras consequat.\n\nPraesent dapibus, neque id cursus faucibus, tortor neque egestas auguae, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.'),
          )
        ],
      ),
    );
  }
}
