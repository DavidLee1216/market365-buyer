

import 'package:buyer/screens/auth/login.dart';
import 'package:buyer/screens/auth/register.dart';
import 'package:buyer/screens/event/event.dart';
import 'package:buyer/screens/event/event_select.dart';
import 'package:buyer/screens/mypage/helpsupport.dart';
import 'package:buyer/screens/mypage/mypage.dart';
import 'package:buyer/screens/notes/deliverytimenotice.dart';
import 'package:buyer/screens/notes/notes.dart';

import 'package:buyer/screens/stores/storeselection.dart';

import 'package:buyer/utils/appsettings.dart';
import 'package:buyer/utils/uatheme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppSettings.appName,
      debugShowCheckedModeBanner: false,
      home: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UATheme.init(context);
    return MaterialApp(
      title: AppSettings.appName,
      debugShowCheckedModeBanner: false,
      theme: UATheme.setTheme(context),
      home:MyPage(),
    );
  }
}
