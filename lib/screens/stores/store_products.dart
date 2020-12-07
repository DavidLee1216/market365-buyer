import 'package:buyer/models/product.dart';
import 'package:buyer/models/store.dart';
import 'package:buyer/screens/stores/product_details.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/services/poducts_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/widget/empty_box.dart';
import 'package:buyer/widget/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StoreProducts extends StatefulWidget {
  final Store store;

  StoreProducts({this.store});

  @override
  _StoreProductsState createState() => _StoreProductsState();
}

class _StoreProductsState extends State<StoreProducts> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(widget.store.description),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            color: AppSettings.primaryColor.withAlpha(20),
            child: Column(
              children: [
                Text('대표 메뉴', textScaleFactor: 1.3),
                SizedBox(height: 15),
                FutureBuilder(
                  future: getSignatureProducts(widget.store.storeID),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData)
                      return snapshot.data.docs.isNotEmpty
                          ? ListView.builder(
                              itemCount: snapshot.data.docs.length,
                              padding: EdgeInsets.all(15),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, i) {
                                Product product =
                                    Product.fromDocument(snapshot.data.docs[i]);
                                return Container(
                                  padding: EdgeInsets.all(15),
                                  margin: EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(color: Colors.grey.shade300),
                                  ),
                                  child: ListTile(
                                    onTap: () => open(context,
                                        ProductDetails(product: product)),
                                    dense: true,
                                    title: Text(product.title,
                                        textScaleFactor: 1.2,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    subtitle: Text(
                                        product.price.toString() + ' 원',
                                        textScaleFactor: 1.1),
                                  ),
                                );
                              })
                          : EmptyBox(text: 'Nothing to show');
                    else
                      return LoadingData();
                  },
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: getStoreProducts(widget.store.storeID),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData)
                return snapshot.data.docs.isNotEmpty
                    ? ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        padding: EdgeInsets.all(15),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) {
                          Product product =
                              Product.fromDocument(snapshot.data.docs[i]);
                          return Container(
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: ListTile(
                              onTap: () => open(
                                  context, ProductDetails(product: product)),
                              dense: true,
                              title: Text(product.title,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: Text(product.price.toString() + ' 원'),
                            ),
                          );
                        })
                    : EmptyBox(text: 'Nothing to show');
              else
                return LoadingData();
            },
          ),
        ],
      ),
    );
  }
}
