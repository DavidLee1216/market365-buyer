import 'package:buyer/screens/orders/order_history.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/utils/uatheme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppSettings.appName,
      debugShowCheckedModeBanner: false,
      home: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UATheme.init(context);
    return MaterialApp(title: AppSettings.appName, debugShowCheckedModeBanner: false, theme: UATheme.setTheme(context), home: OrderHistory());
  } //ProductDetails(product: Product(image: 'https://cdn.pixabay.com/photo/2017/05/07/08/56/pancakes-2291908__480.jpg', title: 'Product Title', price: 348),),
}
