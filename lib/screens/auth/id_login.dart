import 'package:buyer/services/alert_service.dart';
import 'package:buyer/services/auth_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/widget/custom_button.dart';
import 'package:buyer/widget/custom_textbox.dart';
import 'package:flutter/material.dart';

class IdLogin extends StatefulWidget {
  @override
  _IdLoginState createState() => _IdLoginState();
}

class _IdLoginState extends State<IdLogin> {
  TextEditingController emailTEC = TextEditingController();
  TextEditingController passwordTEC = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var node;

  @override
  Widget build(BuildContext context) {
    node = FocusScope.of(context);
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 20,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('이메일로 로그인', style: TextStyle(fontWeight: FontWeight.w700)),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
            child: Column(
              children: [
                SizedBox(height: 15),
                CustomTextField(
                    hint: '이메일',
                    controller: emailTEC,
                    node: node,
                    isPassword: false,
                    isEmail: true),
                SizedBox(height: 15),
                CustomTextField(
                    hint: '비밀번호',
                    controller: passwordTEC,
                    node: node,
                    isPassword: true,
                    isEmail: false),
                SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  child: CustomButton(
                      text: '로그인',
                      function: () async {
                        if (!formKey.currentState.validate()) return;
                        if (signIn(email: emailTEC.text, password: passwordTEC.text, context: context)) {
                        } else
                          alert('로그인 실패');
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
