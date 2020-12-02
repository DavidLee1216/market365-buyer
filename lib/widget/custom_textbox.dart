import 'package:buyer/services/validation_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPassword, isEmail;
  final node;

  CustomTextField(
      {this.hint, this.controller, this.isPassword, this.node, this.isEmail});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        validator: (val) => validate(val),
        textInputAction: TextInputAction.next,
        onEditingComplete: () => node.nextFocus(),
        style: TextStyle(fontFamily: 'Font'),
        obscureText: isPassword,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15),
          hintText: hint,
          hintStyle: TextStyle(
              color: Colors.grey.shade300,
              fontSize: 13,
              fontWeight: FontWeight.bold),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(width: 1.2, color: Color(0xff005D45)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: AppSettings.primaryColor),
          ),
        ),
      ),
    );
  }

  validate(val) {
    if (isEmail != null && isEmail)
      return validateEmail(val);
    else
      return validateText(val);
  }
}
