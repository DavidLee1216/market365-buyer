import 'package:buyer/screens/auth/login.dart';
import 'package:buyer/bloc/cart_bloc.dart';
import 'package:buyer/screens/home/main_screen.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/utils/uatheme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cart_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
      BlocProvider<CartBloc>(
          create: (context) => CartBloc()..add(InitCartEvent()),
          child: MyApp(),
      )
  );
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
    return MaterialApp(
      title: AppSettings.appName,
      debugShowCheckedModeBanner: false,
      theme: UATheme.setTheme(context),
      home: open(),
    );
  }

  open() {
    if (FirebaseAuth.instance.currentUser == null)
      return Login();
    else
      return MainScreen();
  }
}
