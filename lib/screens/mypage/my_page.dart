import 'package:buyer/screens/mypage/change_password.dart';
import 'package:buyer/screens/mypage/help_support.dart';
import 'package:buyer/screens/mypage/information_settings.dart';
import 'package:buyer/screens/mypage/review_settings.dart';
import 'package:buyer/screens/mypage/user.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/widget/custom_button.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MyPage',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_rounded,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(15),
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200)),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 18,
                  ),
                  title: Text(
                    'Order History',
                    textScaleFactor: 0.9,
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.edit,
                    color: Colors.black,
                    size: 18,
                  ),
                  title: Text(
                    'Notice',
                    textScaleFactor: 0.9,
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    open(context, HelpSupport());
                  },
                  leading: Icon(
                    Icons.live_help,
                    color: Colors.black,
                    size: 18,
                  ),
                  title: Text(
                    'Help Support',
                    textScaleFactor: 0.9,
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    open(context, ReviewSettings());
                  },
                  leading: Icon(
                    Icons.note_sharp,
                    color: Colors.black,
                    size: 18,
                  ),
                  title: Text(
                    'Review Settings',
                    textScaleFactor: 0.9,
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    open(context, InformationSettings());
                  },
                  leading: Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 18,
                  ),
                  title: Text(
                    'My Information Settings',
                    textScaleFactor: 0.9,
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    open(context, User());
                  },
                  leading: Icon(
                    Icons.help_rounded,
                    color: Colors.black,
                    size: 18,
                  ),
                  title: Text(
                    'User Guide',
                    textScaleFactor: 0.9,
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    open(context, ChangePassword());
                  },
                  leading: Icon(
                    Icons.lock,
                    color: Colors.black,
                    size: 18,
                  ),
                  title: Text(
                    'Change Password',
                    textScaleFactor: 0.9,
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomButton(
            color: Color(0xffF7973B),
            function: () {},
            text: 'Log Out',
          )
        ],
      ),
    );
  }
}
