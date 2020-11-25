import 'package:buyer/models/category.dart';
import 'package:buyer/models/product.dart';
import 'package:buyer/screens/home/home/home.dart';
import 'package:buyer/screens/stores/store_selection.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/services/poducts_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/utils/uatheme.dart';
import 'package:buyer/widget/cached_image.dart';
import 'package:buyer/widget/empty_box.dart';
import 'package:buyer/widget/loading.dart';
import 'package:buyer/widget/product_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<Category> categories = [
    Category(name: 'Meat', image: ''),
    Category(name: 'Seafood', image: ''),
    Category(name: 'Stock Fish', image: ''),
    Category(name: 'Vegetable', image: ''),
    Category(name: 'Fruit', image: ''),
    Category(name: 'Side Dish', image: ''),
    Category(name: 'Food', image: ''),
    Category(name: 'Etc', image: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  controller.animateTo(5);
                });
              },
              child: Container(
                height: UATheme.screenHeight * 0.3,
                child: CachedImage(
                  rounded: false,
                  url: 'https://media.istockphoto.com/vectors/bright-modern-mega-sale-banner-for-advertising-discounts-vector-for-vector-id1194343598',
                  height: UATheme.screenWidth,
                ),
              ),
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 1, mainAxisSpacing: 15, crossAxisSpacing: 10),
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    open(context, StoreSelect());
                    storeTab = i;
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 0.75), borderRadius: BorderRadius.circular(5)),
                          child: CachedImage(rounded: false, height: double.infinity, url: categories[i].image),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(categories[i].name),
                    ],
                  ),
                );
              },
            ),
            section('Market', 'isMarket', 1),
            section('BEST', 'isBest', 2),
            section('Today\'s Menu', 'isToday', 3),
          ],
        ),
      ),
    );
  }

  section(String title, String type, int jumpTo) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(title, textScaleFactor: 1.4),
        ),
        Container(
          height: 150,
          child: FutureBuilder(
            future: getProductsList(type, true),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData)
                return snapshot.data.docs.isNotEmpty
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.all(10),
                        shrinkWrap: true,
                        itemCount: snapshot.data.docs.length + 1,
                        itemBuilder: (context, i) {
                          if (i != snapshot.data.docs.length)
                            return Container(height: 150, width: 150, margin: EdgeInsets.only(right: 10), child: ProductItem(product: Product.fromDocument(snapshot.data.docs[i])));
                          else
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  controller.animateTo(jumpTo);
                                });
                              },
                              child: Container(
                                height: 150,
                                width: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white), backgroundColor: AppSettings.primaryColor, radius: 20),
                                    SizedBox(height: 10),
                                    Text('View All'),
                                  ],
                                ),
                              ),
                            );
                        },
                      )
                    : EmptyBox(text: 'Nothing to show');
              else
                return LoadingData();
            },
          ),
        ),
        SizedBox(height: 25),
      ],
    );
  }
}
