import 'package:buyer/models/mydropdown.dart';
import 'package:buyer/models/shop_list.dart';
import 'package:buyer/utils/appsettings.dart';
import 'package:buyer/widget/shop_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreSelect extends StatefulWidget {
  @override
  _StoreSelectState createState() => _StoreSelectState();
}

class _StoreSelectState extends State<StoreSelect> {
  List<ListItem> _dropdownItems = [ListItem(1, "Select Market"), ListItem(2, "Second Item"), ListItem(3, "Third Item"), ListItem(4, "Fourth Item")];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
    setState(() {});
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(
            listItem.name,
            textScaleFactor: 0.8,
          ),
          value: listItem,
        ),
      );
    }
    return items;
  }

  List<Shop> shoplists = [
    Shop(name: 'My Town Meat', address: 'Samgyeopsal 200g, Bulgogi...', reviews: '5 Reviews'),
    Shop(name: 'My Town Meat', address: 'Samgyeopsal 200g, Bulgogi...', reviews: '5 Reviews'),
    Shop(name: 'My Town Meat', address: 'Samgyeopsal 200g, Bulgogi...', reviews: '5 Reviews'),
    Shop(name: 'My Town Meat', address: 'Samgyeopsal 200g, Bulgogi...', reviews: '5 Reviews'),
    Shop(name: 'My Town Meat', address: 'Samgyeopsal 200g, Bulgogi...', reviews: '5 Reviews'),
    Shop(name: 'My Town Meat', address: 'Samgyeopsal 200g, Bulgogi...', reviews: '5 Reviews'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/logo1.png'),
                  Container(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    margin: EdgeInsets.all(0),
                    height: 30,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), border: Border.all(color: AppSettings.primaryColor)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<ListItem>(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: AppSettings.primaryColor,
                          ),
                          value: _selectedItem,
                          items: _dropdownMenuItems,
                          onChanged: (value) {
                            setState(() {
                              _selectedItem = value;
                            });
                          }),
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.shopping_cart_rounded,
                        color: AppSettings.primaryColor,
                      ),
                      onPressed: null)
                ],
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 5,
                child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.white,
                    title: TabBar(
                      isScrollable: true,
                      indicatorColor: Colors.orange,
                      labelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelColor: Colors.black,
                      labelStyle: TextStyle(fontSize: 12),
                      unselectedLabelStyle: TextStyle(fontSize: 12),
                      tabs: [
                        Tab(
                          text: 'Meat',
                        ),
                        Tab(
                          text: 'Vegetable',
                        ),
                        Tab(
                          text: 'Fruit ',
                        ),
                        Tab(
                          text: 'Sea Food',
                        ),
                        Tab(
                          text: 'StockFish',
                        ),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: <Widget>[
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: shoplists.length,
                        itemBuilder: (context, i) {
                          return ShopListItem(
                            shopList: shoplists[i],
                          );
                        },
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: shoplists.length,
                        itemBuilder: (context, i) {
                          return ShopListItem(
                            shopList: shoplists[i],
                          );
                        },
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: shoplists.length,
                        itemBuilder: (context, i) {
                          return ShopListItem(
                            shopList: shoplists[i],
                          );
                        },
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: shoplists.length,
                        itemBuilder: (context, i) {
                          return ShopListItem(
                            shopList: shoplists[i],
                          );
                        },
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: shoplists.length,
                        itemBuilder: (context, i) {
                          return ShopListItem(
                            shopList: shoplists[i],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
