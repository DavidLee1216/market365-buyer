import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/widget/custom_button.dart';
import 'package:buyer/widget/custom_textbox.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InformationSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Information Settings',
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            close(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 2,
                    child: Text(
                      'Delivery Address',
                      textScaleFactor: 0.9,
                    )),
                Expanded(
                  child: CustomButton(
                    text: 'Change Address',
                    function: () {},
                    showShadow: false,
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 3,
                    child: Text('Cheongjusi Chungbuk', textScaleFactor: 0.9)),
                Row(
                  children: [
                    Icon(FontAwesomeIcons.ban, color: Colors.red, size: 18),
                    Text(' Delivery Unavailable',
                        style: TextStyle(color: Colors.red),
                        textScaleFactor: 0.9),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 3,
                    child:
                        Text('[Address Name] 000Ro123', textScaleFactor: 0.9)),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.check,
                      color: AppSettings.primaryColor,
                      size: 18,
                    ),
                    Text(' Delivery available',
                        style: TextStyle(color: AppSettings.primaryColor),
                        textScaleFactor: 0.9),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            CustomTextField(hint: 'Detailed Address'),
            SizedBox(height: 50),
            CustomButton(text: 'Save', function: () {}, showShadow: true)
          ],
        ),
      ),
    );
  }
}
