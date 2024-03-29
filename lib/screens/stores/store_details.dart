import 'package:buyer/models/store.dart';
import 'package:buyer/screens/cart/view_cart.dart';
import 'package:buyer/screens/stores/shop_reviews.dart';
import 'package:buyer/screens/stores/store_info.dart';
import 'package:buyer/screens/stores/store_products.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:flutter/material.dart';

class StoreDetails extends StatefulWidget {
  final Store store;

  StoreDetails({this.store});

  @override
  _StoreDetailsState createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 20,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.store.name,
          ),
          actions: [
            IconButton(
              onPressed: () => open(context, ViewCart()),
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
                      widget.store.name,
                      textScaleFactor: 1.3,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '운영시간',
                        textScaleFactor: 1,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.store.openHour.toString() +
                            " - " +
                            widget.store.closeHour.toString(),
                        textScaleFactor: 1,
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
                        '   휴무일',
                        textScaleFactor: 1,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.store.closeDays.toString(),
                        textScaleFactor: 1,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.store.reviews.toString() + ' 리뷰',
                    textScaleFactor: 1,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
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
                        Tab(text: '상품'),
                        Tab(text: '정보'),
                        Tab(text: '리뷰'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: <Widget>[
                          StoreProducts(store: widget.store),
                          StoreInfo(store: widget.store),
                          ShopReview(
                              storeID: widget.store.storeID,
                              reviews: widget.store.reviews),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
