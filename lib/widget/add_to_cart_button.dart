import 'package:buyer/models/cart.dart';
import 'package:buyer/models/product.dart';
import 'package:buyer/services/alert_service.dart';
import 'package:buyer/services/cart_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/widget/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  final Product product;

  AddToCartButton({this.product});

  int index;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getCartItems(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasData) {
          Cart cart = Cart.fromDocument(snapshot.data);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              color: AppSettings.primaryColor,
              text: '장바구니',
              function: () {
                addToCart(product);
                alert('장바구니에 담았습니다.');
              },
//              color: cart != null && checkIfInCart(cart)
//                  ? Colors.grey
//                  : AppSettings.primaryColor,
//              text: (cart != null && checkIfInCart(cart) ? '장바구니 비우기' : '장바구니'),
//              function: () {
//                cart != null && checkIfInCart(cart)
//                    ? removeFromCart(cart.products[index])
//                    : addToCart(product);
//              },
            ),
          );
        } else
          return Container();
      },
    );
  }

  checkIfInCart(Cart cart) {
    for (int i = 0; i < cart.products.length; i++) {
      print(cart.products[i].productID + " ** " + product.productID);
      if (cart.products[i].productID == product.productID) {
        index = i;
        return true;
      }
    }
    return false;
  }
}
