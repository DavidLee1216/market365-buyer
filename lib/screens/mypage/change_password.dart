import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/widget/custom_button.dart';
import 'package:buyer/widget/custom_textbox.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '비밀번호 변경',
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            close(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(flex: 2, child: Text('현재 비밀번호')),
                Expanded(flex: 3, child: CustomTextField(isPassword: true)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(flex: 2, child: Text('새로운 비밀번호')),
                Expanded(flex: 3, child: CustomTextField(isPassword: true)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(flex: 2, child: Text('새로운 비밀번호 확인')),
                Expanded(flex: 3, child: CustomTextField(isPassword: true)),
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  color: AppSettings.primaryColor,
                  function: () {},
                  text: '변경',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
