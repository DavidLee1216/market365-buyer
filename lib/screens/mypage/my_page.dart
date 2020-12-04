import 'package:buyer/screens/auth/login.dart';
import 'package:buyer/screens/mypage/change_password.dart';
import 'package:buyer/screens/mypage/help_support.dart';
import 'package:buyer/screens/mypage/information_settings.dart';
import 'package:buyer/screens/mypage/notices.dart';
import 'package:buyer/screens/mypage/review_settings.dart';
import 'package:buyer/screens/mypage/user.dart';
import 'package:buyer/screens/orders/order_history.dart';
import 'package:buyer/services/auth_service.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_settings.dart';
import '../../utils/uatheme.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
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
            '마이페이지',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_rounded,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade200)),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      open(context, OrderHistory());
                    },
                    leading: Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 25,
                    ),
                    title: Text(
                      '주문내역 리스트',
                      textScaleFactor: 1,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.black,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      open(context, Notices());
                    },
                    leading: Icon(
                      Icons.edit,
                      color: Colors.black,
                      size: 25,
                    ),
                    title: Text(
                      '공지사항',
                      textScaleFactor: 1,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.black,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      open(context, HelpSupport());
                    },
                    leading: Icon(
                      Icons.live_help,
                      color: Colors.black,
                      size: 25,
                    ),
                    title: Text(
                      '고객센터',
                      textScaleFactor: 1,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.black,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      open(context, ReviewSettings());
                    },
                    leading: Icon(
                      Icons.note_sharp,
                      color: Colors.black,
                      size: 25,
                    ),
                    title: Text(
                      '리뷰관리',
                      textScaleFactor: 1,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.black,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      open(context, InformationSettings());
                    },
                    leading: Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 25,
                    ),
                    title: Text(
                      '개인정보 수정',
                      textScaleFactor: 1,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.black,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      open(context, User());
                    },
                    leading: Icon(
                      Icons.help_rounded,
                      color: Colors.black,
                      size: 25,
                    ),
                    title: Text(
                      '이용안내',
                      textScaleFactor: 1,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.black,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      open(context, ChangePassword());
                    },
                    leading: Icon(
                      Icons.lock,
                      color: Colors.black,
                      size: 25,
                    ),
                    title: Text(
                      '비밀번호 변경',
                      textScaleFactor: 1,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                color: Color(0xffF7973B),
                function: () async {
                  await signOut();
                  closeOpen(context, Login());
                },
                text: '로그아웃',
              ),
              ]
            ),
          ],
        ),
      ),
    );
  }
}
