import 'package:buyer/screens/home/delivery_times/available_delivery_times.dart';
import 'package:buyer/screens/home/home/home.dart';
import 'package:buyer/screens/mypage/my_page.dart';
import 'package:buyer/screens/search/search.dart';
import 'package:buyer/screens/stores/store_selection.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

int currentIndex = 0;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white24,
        backgroundColor: AppSettings.primaryColor,
        items: [
          BottomNavigationBarItem(
              backgroundColor: AppSettings.primaryColor,
              icon: Icon(Icons.home),
              title: Text('홈')),
          BottomNavigationBarItem(
              backgroundColor: AppSettings.primaryColor,
              icon: Icon(Icons.access_time),
              title: Text('배송')),
          BottomNavigationBarItem(
              backgroundColor: AppSettings.primaryColor,
              icon: Icon(Icons.category),
              title: Text('품목')),
          BottomNavigationBarItem(
              backgroundColor: AppSettings.primaryColor,
              icon: Icon(Icons.search),
              title: Text('검색')),
          BottomNavigationBarItem(
              backgroundColor: AppSettings.primaryColor,
              icon: Icon(Icons.person),
              title: Text('마이페이지')),
        ],
      ),
      body: _children[currentIndex],
    );
  }

  void onTabTapped(int index) {
    storeTab = 0;
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> _children = [
    Home(),
    AvailableDeliveryTimes(),
    StoreSelect(),
    Search(),
    MyPage(),
  ];
}
