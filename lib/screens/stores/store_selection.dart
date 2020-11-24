import 'package:buyer/models/market.dart';
import 'package:buyer/models/store.dart';
import 'package:buyer/screens/cart/view_cart.dart';
import 'package:buyer/services/market_service.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/services/store_servic.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/utils/uatheme.dart';
import 'package:buyer/widget/empty_box.dart';
import 'package:buyer/widget/loading.dart';
import 'package:buyer/widget/shop_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

int storeTab;

class StoreSelect extends StatefulWidget {
  @override
  _StoreSelectState createState() => _StoreSelectState();
}

class _StoreSelectState extends State<StoreSelect> {
  Market chosenMarket;
  List<Market> markets;
  bool isLoading = true;

  getAllMarkets() async {
    markets = List();
    QuerySnapshot querySnapshot = await getMarkets();
    for (int i = 0; i < querySnapshot.docs.length; i++) markets.add(Market.fromDocument(querySnapshot.docs[i]));

    chosenMarket = markets[0];
    selectedMarket = chosenMarket.name;
    setState(() {
      isLoading = false;
    });
  }

  void initState() {
    super.initState();
    getAllMarkets();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: storeTab,
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 5,
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              Image.asset('assets/images/logo1.png', width: UATheme.screenWidth * 0.3),
              Container(
                padding: const EdgeInsets.only(left: 10.0, right: 5.0),
                margin: EdgeInsets.only(left: 5),
                height: 30,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: AppSettings.primaryColor)),
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
                          child: Text(c.name),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          chosenMarket = value;
                        });
                      }),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(icon: Icon(Icons.shopping_cart_rounded, color: AppSettings.primaryColor), onPressed: () => open(context, ViewCart())),
          ],
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.orange,
            labelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 12),
            unselectedLabelStyle: TextStyle(fontSize: 12),
            tabs: [
              Tab(text: 'Meat'),
              Tab(text: 'Seafood'),
              Tab(text: 'Stock Fish'),
              Tab(text: 'Vegetable'),
              Tab(text: 'Fruit'),
              Tab(text: 'Side Dish'),
              Tab(text: 'Food'),
              Tab(text: 'Etc'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            getScreen('Meat'),
            getScreen('Seafood'),
            getScreen('Stock Fish'),
            getScreen('Vegetable'),
            getScreen('Fruit'),
            getScreen('Side Dish'),
            getScreen('Food'),
            getScreen('Etc'),
          ],
        ),
      ),
    );
  }

  getScreen(String category) {
    return FutureBuilder(
      future: getStoresForCategory(category),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return snapshot.data.docs.isNotEmpty
              ? ListView.builder(
                  padding: EdgeInsets.all(15),
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, i) {
                    Store store = Store.fromDocument(snapshot.data.docs[i]);
                    return ShopItem(store: store);
                  },
                )
              : EmptyBox(text: 'Nothing to show');
        } else
          return LoadingData();
      },
    );
  }
}
