import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/utils/appsettings.dart';
import 'package:buyer/widget/custombutton.dart';
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:10,right: 10),
            child: Row(
              children: [
                Expanded(child: Text('Current Password')),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Color(0xffB9B9B9)),
                    ),
                    child: TextFormField(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:10,right: 10),
            child: Row(
              children: [
                Expanded(child: Text('New Password')),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Color(0xffB9B9B9)),
                    ),
                    child: TextFormField(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:10,right: 10),
            child: Row(
              children: [
                Expanded(child: Text('Confirm Password')),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Color(0xffB9B9B9)),
                    ),
                    child: TextFormField(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          CustomButton(
            color: AppSettings.primaryColor,
            function: () {},
            text: 'Change',
          )
        ],
      ),
    );
  }
}
