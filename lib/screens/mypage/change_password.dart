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
          'Change Password',
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
        child: Column(
          children: [
            Row(
              children: [
                Expanded(flex: 2, child: Text('Current Password')),
                Expanded(flex: 3, child: CustomTextField()),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(flex: 2, child: Text('New Password')),
                Expanded(flex: 3, child: CustomTextField()),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(flex: 2, child: Text('Confirm Password')),
                Expanded(flex: 3, child: CustomTextField()),
              ],
            ),
            SizedBox(height: 40),
            CustomButton(
              color: AppSettings.primaryColor,
              function: () {},
              text: 'Change',
            )
          ],
        ),
      ),
    );
  }
}
