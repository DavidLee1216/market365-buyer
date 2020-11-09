import 'package:buyer/models/shop.dart';
import 'package:buyer/screens/stores/shop_reviews.dart';
import 'package:buyer/screens/stores/store_info.dart';
import 'package:buyer/screens/stores/store_products.dart';
import 'package:flutter/material.dart';

class StoreDetails extends StatefulWidget {
  final Shop shop;

  StoreDetails({this.shop});

  @override
  _StoreDetailsState createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.shop.name,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_rounded,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Text(
                    widget.shop.name,
                    textScaleFactor: 1.3,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Open/Closed',
                      textScaleFactor: 0.8,
                    ),
                    Text(
                      widget.shop.openTime,
                      textScaleFactor: 0.8,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Closed Day',
                      textScaleFactor: 0.8,
                    ),
                    Text(
                      widget.shop.closeDay,
                      textScaleFactor: 0.8,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.shop.reviews,
                  textScaleFactor: 0.8,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TabBar(
                    indicatorColor: Colors.orange,
                    labelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.tab,
                    unselectedLabelColor: Colors.grey.shade400,
                    indicatorWeight: 3,
                    labelStyle: TextStyle(fontSize: 14),
                    unselectedLabelStyle: TextStyle(fontSize: 14),
                    tabs: [
                      Tab(text: 'Product'),
                      Tab(text: 'Information'),
                      Tab(text: 'Review'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        StoreProducts(),
                        StoreInfo(shop: widget.shop),
                        ShopReview(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
