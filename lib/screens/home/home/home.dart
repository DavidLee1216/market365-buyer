import 'package:buyer/models/market.dart';
import 'package:buyer/screens/cart/view_cart.dart';
import 'package:buyer/screens/home/event/events.dart';
import 'package:buyer/screens/home/home/home_tab.dart';
import 'package:buyer/screens/home/market/products_list.dart';
import 'package:buyer/screens/home/notices/notices.dart';
import 'package:buyer/services/market_service.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/services/notification_service.dart';
import 'package:buyer/services/user_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/utils/uatheme.dart';
import 'package:buyer/widget/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TabController controller;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  Market chosenMarket;
  List<Market> markets;
  bool isLoading = true;

  getAllMarkets() async {
    markets = List();
    QuerySnapshot querySnapshot = await getMarkets();
    for (int i = 0; i < querySnapshot.docs.length; i++)
      markets.add(Market.fromDocument(querySnapshot.docs[i]));

    chosenMarket = markets[0];
    selectedMarket = markets[0].name;
    setState(() {
      isLoading = false;
    });
  }

  void initState() {
    super.initState();
    controller = TabController(length: 6, vsync: this);
    getAllMarkets();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: getCurrentUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            registerFirebase(context);
            return page();
          } else
            return loading();
        },
      ),
    );
  }

  loading() {
    return Scaffold(body: LoadingData());
  }

  page() {
    return isLoading
        ? loading()
        : Container(
            padding: const EdgeInsets.only(top: 15, bottom: 20),
            child: Scaffold(
              appBar: AppBar(
                titleSpacing: 10,
                backgroundColor: Colors.transparent,
                title: Row(
                  children: [
                    Image.asset('assets/images/logo1.png',
                        width: UATheme.screenWidth * 0.35),
                    Container(
                      padding: const EdgeInsets.only(left: 20.0, right: 5.0),
                      margin: EdgeInsets.only(left: 10),
                      height: 35,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppSettings.primaryColor,
                          width: 1.5,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<Market>(
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: AppSettings.primaryColor,
                            ),
                            value: chosenMarket,
                            items: markets.map((Market c) {
                              return DropdownMenuItem<Market>(
                                value: c,
                                child: Text(c.name,
                                    style: TextStyle(fontSize: 13)),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                chosenMarket = value;
                                selectedMarket = chosenMarket.name;
                              });
                            }),
                      ),
                    ),
                  ],
                ),
                actions: [
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                        icon: Icon(Icons.shopping_cart_rounded,
                            color: AppSettings.primaryColor),
                        onPressed: () => open(context, ViewCart())),
                  ),
                ],
                bottom: TabBar(
                  indicatorWeight: 3,
                  controller: controller,
                  isScrollable: true,
                  indicatorColor: Colors.orange,
                  labelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  unselectedLabelColor: Colors.black,
                  labelStyle: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                  tabs: [
                    Tab(text: '홈'),
                    Tab(text: '번개장터'),
                    Tab(text: '베스트'),
                    Tab(text: '오늘의밥상'),
                    Tab(text: '공지사항'),
                    Tab(text: '이벤트'),
                  ],
                ),
              ),
              body: TabBarView(
                controller: controller,
                children: <Widget>[
                  HomeTab(),
                  ProductsList(type: 'isMaket'),
                  ProductsList(type: 'isBest'),
                  ProductsList(type: 'isToday'),
                  Notices(),
                  Events(),
                ],
              ),
            ),
          );
  }
}
