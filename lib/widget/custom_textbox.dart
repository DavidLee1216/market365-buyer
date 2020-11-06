import 'package:buyer/utils/app_settings.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;

  CustomTextField({this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade300),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(width: 0.75, color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: AppSettings.primaryColor),
          ),
        ),
      ),
    );
  }
}
