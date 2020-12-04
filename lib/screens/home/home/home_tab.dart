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
    Category(name: '정육/닭', image: ''),
    Category(name: '수산', image: ''),
    Category(name: '건어물', image: ''),
    Category(name: '야채', image: ''),
    Category(name: '과일', image: ''),
    Category(name: '국/반찬', image: ''),
    Category(name: '먹거리', image: ''),
    Category(name: '기타', image: ''),
  ];

  @override
  Widget build(BuildContext context) {
    var TermsOfUse = Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
      children: [
        Row(
          children: [
            Text(
              '이용약관',
              style: TextStyle(
                color: Color(0xff595959),
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              '개인정보처리방침',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              '장날 365 | ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '대표자 : 고동훈',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              '개인정보보호책임자 : ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              '고동훈',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              '사업자등록번호 : ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              '834-87-01698',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              width: 50,
            ),
            Text(
              '사업자정보확인',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              '통신판매업 : ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              '제1234-지역이름-12345 호',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              '주소 : ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              '충북 청주시 서원구 신성화로 33, 성화빌딩 301호',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Text(
              '고객센터 : ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              '1234-1234',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        )
      ],
    ));

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
                  url:
                      'https://media.istockphoto.com/vectors/bright-modern-mega-sale-banner-for-advertising-discounts-vector-for-vector-id1194343598',
                  height: UATheme.screenWidth,
                ),
              ),
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 10),
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
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey, width: 0.75),
                              borderRadius: BorderRadius.circular(5)),
                          child: CachedImage(
                              rounded: false,
                              height: double.infinity,
                              url: categories[i].image),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(categories[i].name),
                    ],
                  ),
                );
              },
            ),
            section('번개장터', 'isMarket', 1),
            section('베스트', 'isBest', 2),
            section('오늘의 밥상', 'isToday', 3),
            TermsOfUse,
          ],
        ),
      ),
    );
  }

  Widget _buildBottom() {
    final items = List.generate(10, (i) {
      return ListTile(
        leading: Icon(Icons.notifications_none),
        title: Text('공지사항'),
      );
    });

    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: items,
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
                            return Container(
                                height: 150,
                                width: 150,
                                margin: EdgeInsets.only(right: 10),
                                child: ProductItem(
                                    product: Product.fromDocument(
                                        snapshot.data.docs[i])));
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
                                    CircleAvatar(
                                        child: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Colors.white),
                                        backgroundColor:
                                            AppSettings.primaryColor,
                                        radius: 20),
                                    SizedBox(height: 10),
                                    Text('전체보기'),
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
