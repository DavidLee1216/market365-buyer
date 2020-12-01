import 'package:buyer/services/alert_service.dart';
import 'package:buyer/services/auth_service.dart';
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
      appBar: AppBar(title: Text('회원가입')),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
          child: Column(
            children: [
              SizedBox(height: 15),
              CustomTextField(
                  hint: 'Email',
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
              CustomTextField(
                  hint: '비밀번호 재확인',
                  controller: confirmTEC,
                  node: node,
                  isPassword: true,
                  isEmail: false),
              SizedBox(height: 30),
              Text(
                  '장날365 이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 정보 수신(선택)에 모두 동의합니다.',
                  textScaleFactor: 0.9),
              Container(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Checkbox(
                        value: checkAll,
                        activeColor: Colors.green,
                        onChanged: (bool newValue) {
                          setState(() {
                            if (newValue)
                              checkAll = checkAge =
                                  checkPromo = checkPrivacy = checkTerms = true;
                            else
                              checkAll = checkAge = checkPromo =
                                  checkPrivacy = checkTerms = false;
                          });
                        }),
                    Text('모두 동의', textScaleFactor: 0.9),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border:
                        Border.all(width: 0.75, color: Colors.grey.shade400)),
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    Row(children: [
                      Expanded(child: Text('14세 이상 가입', textScaleFactor: 0.9)),
                      Checkbox(
                          value: checkAge,
                          activeColor: Colors.green,
                          onChanged: (bool newValue) {
                            setState(() {
                              checkAge = newValue;
                            });
                          }),
                      Text('동의', textScaleFactor: 0.9),
                      Text(' (필수)',
                          textScaleFactor: 0.8,
                          style: TextStyle(color: AppSettings.primaryColor)),
                    ]),
                    Row(
                      children: [
                        Expanded(
                            child: Text('장날 365 이용약관', textScaleFactor: 0.9)),
                        Checkbox(
                            value: checkTerms,
                            activeColor: Colors.green,
                            onChanged: (bool newValue) {
                              setState(() {
                                checkTerms = newValue;
                              });
                            }),
                        Text('동의', textScaleFactor: 0.9),
                        Text(' (필수)',
                            textScaleFactor: 0.8,
                            style: TextStyle(color: AppSettings.primaryColor)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text('개인정보 수집 및 이용', textScaleFactor: 0.9)),
                        Checkbox(
                            value: checkPrivacy,
                            activeColor: Colors.green,
                            onChanged: (bool newValue) {
                              setState(() {
                                checkPrivacy = newValue;
                              });
                            }),
                        Text('동의', textScaleFactor: 0.9),
                        Text(' (필수)',
                            textScaleFactor: 0.8,
                            style: TextStyle(color: AppSettings.primaryColor)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: Text('마케팅 사용', textScaleFactor: 0.9)),
                        Checkbox(
                            value: checkPromo,
                            activeColor: Colors.green,
                            onChanged: (bool newValue) {
                              setState(() {
                                checkPromo = newValue;
                              });
                            }),
                        Text('동의', textScaleFactor: 0.9),
                        Text(' (선택)',
                            textScaleFactor: 0.8,
                            style: TextStyle(color: Colors.grey.shade400)),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: CustomButton(
                    text: '회원가입',
                    function: () async {
                      if (!formKey.currentState.validate()) return;
                      if (passwordTEC.text == confirmTEC.text) {
                        if (checkAll ||
                            (checkAge && checkTerms && checkPrivacy)) {
                          signUp(
                              name: emailTEC.text,
                              email: emailTEC.text,
                              password: passwordTEC.text,
                              context: context);
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
