import 'package:flutter/material.dart';

class CustomTextBox extends StatelessWidget {

  final String title;


  CustomTextBox({this.title});

  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.all(8.0),
     child: TextField(style: TextStyle(
     fontSize: 8.0,
     height: 1),
        autocorrect: true,
        decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(),
          ),
        ),),
   );
  }
  }