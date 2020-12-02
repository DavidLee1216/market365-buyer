import 'package:buyer/models/product.dart';
import 'package:buyer/services/poducts_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/widget/empty_box.dart';
import 'package:buyer/widget/loading.dart';
import 'package:buyer/widget/product_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query;
  TextEditingController textEditingController = TextEditingController();

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
            '검색',
            style: TextStyle(fontWeight: FontWeight.w700),
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
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              padding: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: AppSettings.primaryColor)),
              child: TextFormField(
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          query = textEditingController.text;
                          print(query);
                        });
                      },
                      icon: Icon(
                        Icons.search,
                        color: AppSettings.primaryColor,
                      ),
                    ),
                    border: InputBorder.none,
                    hintText: '검색',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: searchProducts(query),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData)
                    return snapshot.data.docs.isNotEmpty
                        ? GridView.builder(
                            padding: EdgeInsets.all(10),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 0.8),
                            shrinkWrap: true,
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, i) {
                              return ProductItem(
                                  product: Product.fromDocument(
                                      snapshot.data.docs[i]));
                            },
                          )
                        : EmptyBox(text: 'Nothing to show');
                  else
                    return LoadingData();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
