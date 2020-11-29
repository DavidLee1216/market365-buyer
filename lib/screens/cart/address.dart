import 'package:buyer/models/mydropdown.dart';
import 'package:buyer/models/order.dart';
import 'package:buyer/screens/orders/order_history.dart';
import 'package:buyer/services/alert_service.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/services/order_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/widget/custom_button.dart';
import 'package:buyer/widget/custom_textbox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';

class Address extends StatefulWidget {
  final DateTime date;
  final String time;
  final int total;

  Address({this.date, this.time, this.total});

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  bool confirmOrder = false;
  List<ListItem> _dropdownItems = [
    ListItem(1, "Select"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item"),
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order',
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            close(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Text(
                            'Delivery Address',
                            textScaleFactor: 0.9,
                          )),
                      Expanded(
                        child: CustomButton(
                          text: 'Change Address',
                          function: () {},
                          showShadow: false,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(flex: 3, child: Text('Cheongjusi Chungbuk', textScaleFactor: 0.9)),
                      Row(
                        children: [
                          Icon(FontAwesomeIcons.ban, color: Colors.red, size: 18),
                          Text(' Delivery Unavailable', style: TextStyle(color: Colors.red), textScaleFactor: 0.9),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(flex: 3, child: Text('[Address Name] 000Ro123', textScaleFactor: 0.9)),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.check,
                            color: AppSettings.primaryColor,
                            size: 18,
                          ),
                          Text(' Delivery available', style: TextStyle(color: AppSettings.primaryColor), textScaleFactor: 0.9),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  CustomTextField(hint: 'Detailed Address', isPassword: false),
                  Divider(color: Colors.grey.shade300, height: 30, thickness: 1),
                  Text('010-1234-1234'),
                  SizedBox(height: 20),
                  Text('Request'),
                  Container(
                    padding: const EdgeInsets.only(left: 10.0, right: 5.0),
                    margin: EdgeInsets.only(top: 10),
                    height: 30,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: AppSettings.primaryColor)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<ListItem>(
                          isExpanded: true,
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
                  Divider(color: Colors.grey.shade300, height: 30, thickness: 1),
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text('Product', style: TextStyle(fontWeight: FontWeight.bold)),
                    trailing: Text('${widget.total} 원', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text('Delivery Fee', style: TextStyle(fontWeight: FontWeight.bold)),
                    trailing: Text('${AppSettings.deliveryFee} 원', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                    trailing: Text('${widget.total + AppSettings.deliveryFee} 원', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Divider(color: Colors.grey.shade300, height: 30, thickness: 1),
                  Text('Payment Method'),
                  Container(
                    padding: const EdgeInsets.only(left: 10.0, right: 5.0),
                    margin: EdgeInsets.only(top: 10),
                    height: 30,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: AppSettings.primaryColor)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<ListItem>(
                          isExpanded: true,
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
                  Divider(color: Colors.grey.shade300, height: 30, thickness: 1),
                  Row(
                    children: [
                      Checkbox(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          value: confirmOrder,
                          activeColor: Colors.green,
                          onChanged: (bool newValue) {
                            setState(() {
                              confirmOrder = newValue;
                            });
                          }),
                      Expanded(child: Text('Confirm Order (Required)', textScaleFactor: 0.9)),
                      SizedBox(width: 15),
                      Expanded(child: Text('View Terms & Conditions', textScaleFactor: 0.9)),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: CustomButton(
              text: 'Order',
              showShadow: false,
              function: () async {
                if (confirmOrder) {
                  await placeOrder(
                    Order(
                      orderID: Uuid().v1(),
                      name: currentUser.name,
                      date: Timestamp.fromDate(widget.date),
                      address: '',
                      delivery: AppSettings.deliveryFee,
                      fees: {},
                      history: [
                        {
                          'status': 'Order placed',
                          'time': Timestamp.now(),
                        }
                      ],
                      paidDate: Timestamp.now(),
                      payment: 'Credit Card',
                      request: '',
                      time: widget.time,
                      user: currentUser.userID,
                      total: widget.total,
                    ),
                  );
                  open(context, OrderHistory());
                } else
                  alert('Please confirm the order to continue');
              },
            ),
          ),
        ],
      ),
    );
  }
}
