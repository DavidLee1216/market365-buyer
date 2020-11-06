import 'package:buyer/models/notice.dart';
import 'package:flutter/material.dart';

class NoticeDetails extends StatefulWidget {
  final Notice notice;

  NoticeDetails({this.notice});

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
            title: Text(widget.notice.title),
            subtitle: Text(widget.notice.date, style: TextStyle(color: Color(0xff585858))),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.\n\nDonec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis.\n\nMorbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod in, pharetra a, ultricies in, diam. Sed arcu. Cras consequat.\n\nPraesent dapibus, neque id cursus faucibus, tortor neque egestas auguae, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.'),
          )
        ],
      ),
    );
  }
}
