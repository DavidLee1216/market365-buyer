import 'package:buyer/screens/auth/register.dart';
import 'package:buyer/services/auth_service.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/utils/uatheme.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  String title, imgURL;
  Color color, textColor;

  containerButton(String title, String imgURL, Color color, Color textColor) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(7)),
          border: Border.all(
              width: 1,
              color: color == Colors.white ? Colors.grey.shade300 : color)),
      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 20,
            height: 20,
            child: Image.asset(imgURL),
          ),
          Expanded(
            child: Container(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14.5,
                  color: textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 80, 10, 50),
              child: Image.asset(
                'assets/images/logo1.png',
                height: 150,
                fit: BoxFit.contain,
                width: UATheme.screenWidth - 100,
              ),
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    InkWell(
                      //onTap: () => closeOpen(context, MainScreen()),
                      child: containerButton(
                          '카카오로 로그인 하기',
                          'assets/images/kako.png',
                          Color(0xffFFED16),
                          Colors.black),
                    ),
                    containerButton('네이버로 로그인 하기', 'assets/images/naver.png',
                        Color(0xff28BF0A), Colors.white),
                    containerButton(
                        '페이스북으로 로그인 하기',
                        'assets/images/facebook.png',
                        Color(0xff3b5998),
                        Colors.white),
                    InkWell(
                        onTap: () => signInWithGoogle(context),
                        child: containerButton(
                            '구글로 로그인 하기',
                            'assets/images/google.png',
                            Colors.white,
                            Colors.black)),
                    containerButton('Apple로 로그인 하기', 'assets/images/apple.png',
                        Color(0xff161616), Colors.white),
                  ],
                )),
            Row(
              children: [
                Expanded(
                  child: FlatButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onPressed: () {},
                    child: Text(
                      '이메일로 로그인',
                      textScaleFactor: 0.85,
                    ),
                    textColor: Colors.black,
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onPressed: () => closeOpen(context, Register()),
                    child: Text(
                      '이메일로 가입하기',
                      textScaleFactor: 0.85,
                    ),
                    textColor: Color(0xff585858),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
