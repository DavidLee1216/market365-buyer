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
    ListItem(1, "First Item"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item"),
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
//    _selectedItem = _dropdownMenuItems[0].value;
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
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 20,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '주문서',
            style: TextStyle(fontWeight: FontWeight.w700),
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
                              '배송 주소지',
                              textScaleFactor: 1.1,
                              style: TextStyle(fontWeight: FontWeight.w700),
                            )),
                        Expanded(
                          child: CustomButton(
                            text: '배송지 변경',
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
                        Expanded(
                            flex: 3, child: Text('충북 청주시', textScaleFactor: 1)),
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.ban,
                                color: Colors.red, size: 18),
                            Text(
                              ' 배달 불가능',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
                              ),
                              textScaleFactor: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text('[도로명] 000로123', textScaleFactor: 1)),
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.check,
                              color: AppSettings.primaryColor,
                              size: 18,
                            ),
                            Text(' 배달 가능',
                                style: TextStyle(
                                  color: AppSettings.primaryColor,
                                  fontWeight: FontWeight.w700,
                                ),
                                textScaleFactor: 1),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    CustomTextField(hint: '상세주소', isPassword: false),
                    Divider(
                        color: Colors.grey.shade300, height: 30, thickness: 1),
                    Text('010-1234-1234'),
                    SizedBox(height: 20),
                    Text(
                      '요청사항',
                      style: TextStyle(fontSize: 14),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0, right: 5.0),
                      margin: EdgeInsets.only(top: 10),
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: AppSettings.primaryColor, width: 1.2)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<ListItem>(
                            isExpanded: true,
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: AppSettings.primaryColor,
                            ),
                            value: _selectedItem,
                            hint: Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                '[선택]',
                                textAlign: TextAlign.left,
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            items: _dropdownMenuItems,
                            onChanged: (value) {
                              setState(() {
                                _selectedItem = value;
                              });
                            }),
                      ),
                    ),
                    Divider(
                        color: Colors.grey.shade300, height: 30, thickness: 1),
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text('상품 금액',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Text('${widget.total} 원',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          )),
                    ),
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text('배달료',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Text('${AppSettings.deliveryFee} 원',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text('합계',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      trailing: Text(
                          '${widget.total + AppSettings.deliveryFee} 원',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Divider(
                        color: Colors.grey.shade300, height: 30, thickness: 1),
                    Text(
                      '결제수단',
                      style: TextStyle(fontSize: 14),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0, right: 5.0),
                      margin: EdgeInsets.only(top: 10),
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: AppSettings.primaryColor, width: 1.2)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<ListItem>(
                            isExpanded: true,
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: AppSettings.primaryColor,
                            ),
                            value: _selectedItem,
                            hint: Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                '[선택]',
                                textAlign: TextAlign.left,
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            items: _dropdownMenuItems,
                            onChanged: (value) {
                              setState(() {
                                _selectedItem = value;
                              });
                            }),
                      ),
                    ),
                    Divider(
                        color: Colors.grey.shade300, height: 30, thickness: 1),
                    Row(
                      children: [
                        Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: confirmOrder,
                            activeColor: Colors.green,
                            onChanged: (bool newValue) {
                              setState(() {
                                confirmOrder = newValue;
                              });
                            }),
                        Container(
                            child: Text(
                          '결제 진행 동의(필수)',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        Expanded(child: SizedBox(width: 15)),
                        Container(
                            child: Text('약관보기 >'),
                            alignment: Alignment.centerRight,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('개인정보 수집 이용 및 위탁 동의', style: TextStyle(fontSize: 14, decoration: TextDecoration.underline,),),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('전자 금융 거래 기본 약관 동의', style: TextStyle(fontSize: 14, decoration: TextDecoration.underline,),),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: CustomButton(
                text: '결제하기',
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
                    alert('계속하려면 결제 진행에 동의하여야 합니다.');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
