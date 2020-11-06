import 'package:buyer/screens/auth/login.dart';
import 'package:buyer/utils/app_settings.dart';
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
      home: Login(),
    );
  }
}
