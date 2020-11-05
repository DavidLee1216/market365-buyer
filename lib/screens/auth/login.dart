import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  String title, imgURL;
  Color color, textColor;

  containerButton(String title, String imgURL, Color color, Color textColor) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(width: 1, color: color)),
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image(
                image: AssetImage(imgURL),
                height: 20,
                width: 20,
              ),
            ),
            Text(
              title,
              style: TextStyle(color: textColor),
              textScaleFactor: 1,
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Image(image: AssetImage('assets/images/logoicon.png')),
        ),
        containerButton('Login with Kakao Talk', 'assets/images/image 3.png',
            Colors.yellow, Colors.black),
        containerButton('Login with Naver', 'assets/images/image 4.png',
            Colors.green, Colors.white),
        containerButton('Login with Facebook', 'assets/images/image 5.png',
            Colors.indigo, Colors.white),
        containerButton('Login with Google', 'assets/images/pngegg 1.png',
            Colors.white, Colors.black),
        containerButton('Login with Apple', 'assets/images/image 7.png',
            Colors.black, Colors.white),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: null,
              child: Text(
                'Login with Email',
                textScaleFactor: 1,
              ),
            ),
            FlatButton(
              onPressed: null,
              child: Text(
                'Register with Email',
                textScaleFactor: 1,
              ),
            )
          ],
        )
      ]),
    ));
  }
}
