import 'package:buyer/screens/home/main_screen.dart';
import 'package:buyer/services/alert_service.dart';
import 'package:buyer/services/auth_service.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/widget/custom_button.dart';
import 'package:buyer/widget/custom_textbox.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailTEC = TextEditingController();
  TextEditingController passwordTEC = TextEditingController();
  TextEditingController confirmTEC = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var node;
  bool checkAll = false;
  bool checkAge = false;
  bool checkTerms = false;
  bool checkPrivacy = false;
  bool checkPromo = false;

  @override
  Widget build(BuildContext context) {
    node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: 15),
              CustomTextField(hint: 'Email', controller: emailTEC, node: node, isPassword: false),
              SizedBox(height: 15),
              CustomTextField(hint: 'Password', controller: passwordTEC, node: node, isPassword: true),
              SizedBox(height: 15),
              CustomTextField(hint: 'Confirm Password', controller: confirmTEC, node: node, isPassword: true),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Text('I agree all the terms and condition and all the privacy policy', textScaleFactor: 0.9),
                  ),
                  Checkbox(
                      value: checkAll,
                      activeColor: Colors.green,
                      onChanged: (bool newValue) {
                        setState(() {
                          if (newValue)
                            checkAll = checkAge = checkPromo = checkPrivacy = checkTerms = true;
                          else
                            checkAll = checkAge = checkPromo = checkPrivacy = checkTerms = false;
                        });
                      }),
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
                      Checkbox(
                          value: checkAge,
                          activeColor: Colors.green,
                          onChanged: (bool newValue) {
                            setState(() {
                              checkAge = newValue;
                            });
                          }),
                      Text('Agree', textScaleFactor: 0.9),
                      Text(' (required)', textScaleFactor: 0.8, style: TextStyle(color: AppSettings.primaryColor)),
                    ]),
                    Row(
                      children: [
                        Expanded(child: Text('Terms of services', textScaleFactor: 0.9)),
                        Checkbox(
                            value: checkTerms,
                            activeColor: Colors.green,
                            onChanged: (bool newValue) {
                              setState(() {
                                checkTerms = newValue;
                              });
                            }),
                        Text('Agree', textScaleFactor: 0.9),
                        Text(' (required)', textScaleFactor: 0.8, style: TextStyle(color: AppSettings.primaryColor)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: Text('Privacy Policy', textScaleFactor: 0.9)),
                        Checkbox(
                            value: checkPrivacy,
                            activeColor: Colors.green,
                            onChanged: (bool newValue) {
                              setState(() {
                                checkPrivacy = newValue;
                              });
                            }),
                        Text('Agree', textScaleFactor: 0.9),
                        Text(' (required)', textScaleFactor: 0.8, style: TextStyle(color: AppSettings.primaryColor)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: Text('Receive Promotional info', textScaleFactor: 0.9)),
                        Checkbox(
                            value: checkPromo,
                            activeColor: Colors.green,
                            onChanged: (bool newValue) {
                              setState(() {
                                checkPromo = newValue;
                              });
                            }),
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
                    function: () async {
                      if (!formKey.currentState.validate()) return;
                      if (passwordTEC.text == confirmTEC.text) {
                        if (checkAll || (checkAge && checkTerms && checkPrivacy)) {
                          signUp(name: emailTEC.text, email: emailTEC.text, password: passwordTEC.text, context: context);

                          closeOpen(context, MainScreen());
                        } else
                          alert('Please accept required conditions to proceed');
                      } else
                        alert('Passwords don\'t match');
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
