import 'package:buyer/screens/auth/register.dart';
import 'package:buyer/screens/home/home.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/utils/uatheme.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  String title, imgURL;
  Color color, textColor;

  containerButton(String title, String imgURL, Color color, Color textColor) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.all(Radius.circular(5)), border: Border.all(width: 1, color: color == Colors.white ? Colors.grey.shade300 : color)),
      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(imgURL), height: 20, width: 20),
          SizedBox(width: 10),
          Text(title, style: TextStyle(color: textColor)),
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
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: Image.asset(
                'assets/images/logo1.png',
                height: 150,
                fit: BoxFit.contain,
                width: UATheme.screenWidth - 100,
              ),
            ),
            InkWell(
              onTap: () => closeOpen(context, Home()),
              child: containerButton('Login with Kakao Talk', 'assets/images/kako.png', Color(0xffFFED16), Colors.black),
            ),
            containerButton('Login with Naver', 'assets/images/naver.png', Color(0xff28BF0A), Colors.white),
            containerButton('Login with Facebook', 'assets/images/facebook.png', Color(0xff3A559F), Colors.white),
            containerButton('Login with Google', 'assets/images/google.png', Colors.white, Colors.black),
            containerButton('Login with Apple', 'assets/images/apple.png', Color(0xff161616), Colors.white),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: FlatButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onPressed: () {},
                    child: Text(
                      'Login with Email',
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
                      'Register with Email',
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
