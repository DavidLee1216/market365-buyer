import 'package:buyer/models/product.dart';
import 'package:buyer/models/user_model.dart';
import 'package:flutter/material.dart';

User currentUser;
String selectedMarket;
List<Product> cart;

class AppSettings {
  static String appName = 'Buyer';
  static Color primaryColor = Color(0xff005D45);
  static Color appBackground = Colors.white;
  static int price = 0;
}
