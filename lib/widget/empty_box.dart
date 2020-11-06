import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/utils/uatheme.dart';
import 'package:flutter/material.dart';

class EmptyBox extends StatelessWidget {
  final String text;

  EmptyBox({this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(5),
            child: Image.asset('assets/images/logo.png', color: AppSettings.primaryColor.withAlpha(100), height: 50),
          ),
          Text(text, style: TextStyle(color: AppSettings.primaryColor.withAlpha(150), fontSize: UATheme.screenWidth * 0.045)),
        ],
      ),
    );
  }
}
