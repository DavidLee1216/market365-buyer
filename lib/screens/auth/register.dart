import 'package:buyer/screens/home/main_screen.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/widget/custom_button.dart';
import 'package:buyer/widget/custom_textbox.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(height: 15),
            CustomTextField(hint: 'Email'),
            SizedBox(height: 15),
            CustomTextField(hint: 'Password'),
            SizedBox(height: 15),
            CustomTextField(hint: 'Confirm Password'),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Text('I agree all the terms and condition and all the privacy policy', textScaleFactor: 0.9),
                ),
                Checkbox(value: false, activeColor: Colors.green, onChanged: (bool newValue) {}),
                Expanded(flex: 3, child: Text('Agree to all', textScaleFactor: 0.9)),
              ],
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), border: Border.all(width: 0.75, color: Colors.grey.shade400)),
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Column(
                children: [
                  Row(children: [
                    Expanded(child: Text('14 or Older', textScaleFactor: 0.9)),
                    Checkbox(value: false, activeColor: Colors.green, onChanged: (bool newValue) {}),
                    Text('Agree', textScaleFactor: 0.9),
                    Text(' (required)', textScaleFactor: 0.8, style: TextStyle(color: AppSettings.primaryColor)),
                  ]),
                  Row(
                    children: [
                      Expanded(child: Text('Terms of services', textScaleFactor: 0.9)),
                      Checkbox(value: false, activeColor: Colors.green, onChanged: (bool newValue) {}),
                      Text('Agree', textScaleFactor: 0.9),
                      Text(' (required)', textScaleFactor: 0.8, style: TextStyle(color: AppSettings.primaryColor)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Text('Privacy Policy', textScaleFactor: 0.9)),
                      Checkbox(value: false, activeColor: Colors.green, onChanged: (bool newValue) {}),
                      Text('Agree', textScaleFactor: 0.9),
                      Text(' (required)', textScaleFactor: 0.8, style: TextStyle(color: AppSettings.primaryColor)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Text('Receive Promotional info', textScaleFactor: 0.9)),
                      Checkbox(value: false, activeColor: Colors.green, onChanged: (bool newValue) {}),
                      Text('Agree', textScaleFactor: 0.9),
                      Text(' (Optional)', textScaleFactor: 0.8, style: TextStyle(color: Colors.grey.shade400)),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: CustomButton(
                  text: 'Register',
                  function: () {
                    closeOpen(context, MainScreen());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
