import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:buyer/widget/custom_button.dart';
import 'package:buyer/widget/custom_textbox.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InformationSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 20,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '개인정보 수정',
            style: TextStyle(fontWeight: FontWeight.w700),
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
                        '배송 주소지',
                        textScaleFactor: 1.1,
                        style: TextStyle(fontWeight: FontWeight.w700),
                      )),
                  Expanded(
                    child: CustomButton(
                      text: '배송지 변경',
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
                  Expanded(flex: 3, child: Text('충북 청주시', textScaleFactor: 1)),
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      children: [
                        Icon(FontAwesomeIcons.ban, color: Colors.red, size: 20),
                        Text(
                          '  배달 불가능',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w700,
                          ),
                          textScaleFactor: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 3,
                      child: Text('[도로명] 000로123', textScaleFactor: 1)),
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.check,
                          color: AppSettings.primaryColor,
                          size: 20,
                        ),
                        Text('  배달 가능',
                            style: TextStyle(
                              color: AppSettings.primaryColor,
                              fontWeight: FontWeight.w700,
                            ),
                            textScaleFactor: 1),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              CustomTextField(hint: '상세주소', isPassword: false),
              SizedBox(height: 100),
              Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.only(right: 10),
                child: Text('탈퇴하기',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 15,
                      color: Colors.grey[600],
                    ),
                    textScaleFactor: 1),
              ),
              SizedBox(height: 30),
              CustomButton(text: '저장', function: () {}, showShadow: true)
            ],
          ),
        ),
      ),
    );
  }
}
