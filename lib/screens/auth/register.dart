import 'package:buyer/widget/custom_textbox.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
            CustomTextBox(title: 'Email'),
        CustomTextBox(title: 'Password'),
        CustomTextBox(title: 'Confirm Password'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(flex: 2,
                child: Text(
                    'I agree all the terms and condition and all the privacy policy',textScaleFactor: 1.2),
              ),
              Checkbox(value: false,
                  activeColor: Colors.green,
                  onChanged: (bool newValue) {

                  }),
              Text('Remember me',textScaleFactor: 1.2),
            ],
          ),
        ),
        Container(width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(width: 1, color: Colors.black)),
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: [Row(children: [Expanded(child:Text('14 or Older',textScaleFactor: 1.2,)), Checkbox(value: false,
                activeColor: Colors.green,
                onChanged: (bool newValue) {

                }),
              Text('Agree',textScaleFactor: 1.2),
            ]),
              Row(children: [Expanded(child: Text('Terms of services',textScaleFactor: 1.2)), Checkbox(value: false,
                  activeColor: Colors.green,
                  onChanged: (bool newValue) {

                  }),
                Text('Agree',textScaleFactor: 1.2),],),
              Row(children: [Expanded(child: Text('Privacy Policy',textScaleFactor: 1.2)), Checkbox(value: false,
                  activeColor: Colors.green,
                  onChanged: (bool newValue) {

                  }),
                Text('Agree',textScaleFactor: 1.2),],),
              Row(children: [Expanded(child: Text('Receive Promotional info',textScaleFactor: 1.2)), Checkbox(value: false,
                  activeColor: Colors.green,
                  onChanged: (bool newValue) {

                  }),
                Text('Agree',textScaleFactor: 1.2),],),

            ],
          )
        ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: RaisedButton(
                        child: Text(
                          "Show Results",
                          textScaleFactor: 1.2,
                        ),
                        textColor: Colors.white,
                        color: Colors.teal,
                        onPressed: () {
                          // Respond to button press
                        },
                      ),
                    ),
                  ],
                ),
              ),
        ]),
      ),
    );
  }
}
