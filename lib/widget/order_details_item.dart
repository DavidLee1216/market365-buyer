import 'package:buyer/models/product.dart';
import 'package:buyer/screens/stores/post_review.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/widget/custom_button.dart';
import 'package:flutter/material.dart';

class OrderDetailsItem extends StatelessWidget {
  final Product product;
  final String orderID;

  OrderDetailsItem({this.product, this.orderID});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text(product.title)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: Text('Total')),
              Text(product.price.toString() + ' 원', style: TextStyle(fontWeight: FontWeight.bold, color: AppSettings.primaryColor)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 100,
                height: 40,
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                child: CustomButton(
                  showShadow: false,
                  text: 'Write a Review',
                  function: () {
                    open(context, PostReview(product: product, orderID: orderID));
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
