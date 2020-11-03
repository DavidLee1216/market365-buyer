import 'package:buyer/utils/appsettings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UATheme {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;

  static init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }

  static setTheme(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: AppSettings.appBackground,
      statusBarColor: AppSettings.appBackground,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ));

    return ThemeData(
      scaffoldBackgroundColor: AppSettings.appBackground,
      backgroundColor: AppSettings.appBackground,
      primarySwatch: Colors.grey,
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        color: AppSettings.appBackground,
        brightness: Brightness.light,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.black,
            fontSize: 18,
            //fontFamily: 'Font',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFB4BBC2), width: 0.0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFB4BBC2), width: 0.0),
        ),
        disabledBorder: InputBorder.none,
        hintStyle: TextStyle(color: Colors.grey.shade300),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: Colors.black,
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          //fontFamily: 'Font',
        ),
        indicatorSize: TabBarIndicatorSize.label,
        unselectedLabelColor: Colors.grey.shade400,
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          //fontFamily: 'Font',
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(size: 10),
        unselectedIconTheme: IconThemeData(size: 10),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.grey.shade200,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
      textTheme: TextTheme(
        bodyText2: TextStyle(
          //fontFamily: 'Font',
          fontSize: screenWidth * 0.035,
        ),
        button: TextStyle(
          //fontFamily: 'Font',
          fontSize: screenWidth * 0.04,
          color: Colors.white,
        ),
      ),
      primaryTextTheme: TextTheme(
        headline6: TextStyle(
          color: AppSettings.primaryColor,
          //fontFamily: 'Font',
          fontSize: screenWidth * 0.035,
        ),
      ),
    );
  }
//flutter pub pub run flutter_launcher_icons:main
}
