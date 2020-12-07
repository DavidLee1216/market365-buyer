import 'dart:async';

import 'package:buyer/models/cart.dart';
import 'package:buyer/bloc/cart_bloc.dart';
import 'package:buyer/screens/cart/delivery_time.dart';
import 'package:buyer/services/cart_service.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/widget/cart_item.dart';
import 'package:buyer/widget/custom_button.dart';
import 'package:buyer/widget/empty_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewCart extends StatefulWidget {
  @override
  _ViewCartState createState() => _ViewCartState();
}

class _ViewCartState extends State<ViewCart> {

  var bloc = null;

  startTimeout() async {
    var duration = const Duration(seconds: 1);
    return new Timer(duration, handleTimeout);
  }

  void handleTimeout() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<CartBloc>(context);
    bloc.add(LoadCartEvent());
    startTimeout();

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
          title: Text('장바구니', style: TextStyle(fontWeight: FontWeight.w700)),
          actions: [
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                icon: Icon(Icons.remove_shopping_cart),
                onPressed: () async {
                  bloc.add(ClearCartEvent());
//                  await clearCart();
                },
              ),
            )
            // FlatButton(
            //     onPressed: () async {
            //       await clearCart();
            //     },
          ],
        ),
        body: BlocBuilder<CartBloc, CartState>(
          cubit: BlocProvider.of<CartBloc>(context),
          builder: (context, state) {
            if (state.productCartList != null) {
              return Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (context, i) {
                                return CartItem(cartProduct: state.productCartList[i], idx: i);
                              },
                              itemCount: state.productCartList.length,
                            ),
                          ),
                          ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            title: Text('상품',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            trailing: Text('${state.totalPrice} 원',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            title: Text('배달료',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            trailing: Text('${state.deliveryFee} 원',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            title: Text('Total',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            trailing: Text(
                                '${state.totalPrice + state.deliveryFee} 원',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff005D45),
                                    fontSize: 20)),
                          ),
                          CustomButton(
                            text: '주문하기',
                            showShadow: false,
                            function: () {
                              open(
                                  context,
                                  DeliveryTime(
                                      total: state.totalPrice + state.deliveryFee));
                            },
                          ),
                        ],
                      ),
                    );
            } else
              return EmptyBox(text: 'Nothing in cart. Start adding items');
          },
        ),
      ),
    );
  }
}
