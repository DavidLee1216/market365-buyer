import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/utils/uatheme.dart';
import 'package:flutter/material.dart';

class HelpSupport extends StatefulWidget {
  @override
  _HelpSupportState createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help Support',
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            close(context);
          },
        ),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(25),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Do you have any questions?',
                    textScaleFactor: 0.9,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'I will give you an answer as soon as possible.',
                  textScaleFactor: 0.9,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                ListTile(
                  title: Text(
                    'Telephone Enquiry',
                    textScaleFactor: 0.9,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('1544-1544', textScaleFactor: 0.8),
                      Text(' Business hours | 08:00 ~ 20:00',
                          textScaleFactor: 0.8),
                    ],
                  ),
                ),
                ListTile(
                  title: Text(
                    'Kakao Talk Help Service ',
                    textScaleFactor: 0.9,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Business hours | 08:00 ~ 20:00',
                      textScaleFactor: 0.8),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  alignment: Alignment.center,
                  height: 50,
                  width: UATheme.screenWidth * .50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amberAccent,
                  ),
                  child: InkWell(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat_bubble,
                          color: Colors.black,
                          size: 18,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '스크린샷스크린샷',
                          style: TextStyle(color: Colors.black),
                          textScaleFactor: 0.9,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
