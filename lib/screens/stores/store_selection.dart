import 'package:buyer/models/mydropdown.dart';
import 'package:buyer/models/shop.dart';
import 'package:buyer/screens/home/event/events.dart';
import 'package:buyer/screens/home/notices/notices.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/utils/uatheme.dart';
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

  List<Shop> shopLists = [
    Shop(name: 'My Town Meat', address: 'Samgyeopsal 200g, Bulgogi...', reviews: '5 Reviews', closeDay: 'Every Tuesday', openTime: '09:00-21:00'),
    Shop(name: 'My Town Meat', address: 'Samgyeopsal 200g, Bulgogi...', reviews: '5 Reviews', closeDay: 'Every Tuesday', openTime: '09:00-21:00'),
    Shop(name: 'My Town Meat', address: 'Samgyeopsal 200g, Bulgogi...', reviews: '5 Reviews', closeDay: 'Every Tuesday', openTime: '09:00-21:00'),
    Shop(name: 'My Town Meat', address: 'Samgyeopsal 200g, Bulgogi...', reviews: '5 Reviews', closeDay: 'Every Tuesday', openTime: '09:00-21:00'),
    Shop(name: 'My Town Meat', address: 'Samgyeopsal 200g, Bulgogi...', reviews: '5 Reviews', closeDay: 'Every Tuesday', openTime: '09:00-21:00'),
    Shop(name: 'My Town Meat', address: 'Samgyeopsal 200g, Bulgogi...', reviews: '5 Reviews', closeDay: 'Every Tuesday', openTime: '09:00-21:00'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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
            ],
          ),
          actions: [IconButton(icon: Icon(Icons.shopping_cart_rounded, color: AppSettings.primaryColor), onPressed: null)],
        ),
        body: Column(
          children: [
            TabBar(
              isScrollable: true,
              indicatorColor: Colors.orange,
              labelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: Colors.black,
              labelStyle: TextStyle(fontSize: 12),
              unselectedLabelStyle: TextStyle(fontSize: 12),
              tabs: [
                Tab(text: 'Market'),
                Tab(text: 'BEST'),
                Tab(text: 'Today\'s Menu'),
                Tab(text: 'Notice'),
                Tab(text: 'Event'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  getScreen(1),
                  getScreen(2),
                  getScreen(3),
                  Notices(),
                  Events(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getScreen(int i) {
    return ListView.builder(
      itemCount: shopLists.length,
      itemBuilder: (context, i) {
        return ShopListItem(
          shop: shopLists[i],
        );
      },
    );
  }
}
