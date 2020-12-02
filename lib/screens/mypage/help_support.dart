import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/utils/uatheme.dart';
import 'package:flutter/material.dart';

class HelpSupport extends StatefulWidget {
  @override
  _HelpSupportState createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
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
            '고객센터',
            style: TextStyle(fontWeight: FontWeight.w700),
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
            Card(
              margin: EdgeInsets.all(25),
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '궁금한 점이 있으신가요?',
                      textScaleFactor: 1,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    '문의주시면 빠른 답변드리겠습니다.',
                    textScaleFactor: 1,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ListTile(
                    title: Text(
                      '전화 문의',
                      textScaleFactor: 1,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '1544-1544',
                            textScaleFactor: 0.9,
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '고객센터 운영시간 | 오전 8시 ~ 오후 8시',
                            textScaleFactor: 0.9,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      '카카오톡 문의',
                      textScaleFactor: 1,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Container(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          '고객센터 운영시간 | 오전 8시 ~ 오후 8시',
                          textScaleFactor: 0.9,
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    alignment: Alignment.center,
                    height: 50,
                    width: UATheme.screenWidth * .70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amberAccent,
                    ),
                    child: InkWell(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image.asset('assets/images/kakao_1.png'),
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '카카오톡 문의하기',
                            style: TextStyle(
                                color: Color(0xff371C1D),
                                fontWeight: FontWeight.w700),
                            textScaleFactor: 0.9,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
