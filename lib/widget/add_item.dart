import 'package:buyer/utils/app_settings.dart';
import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  final Function pickFromCamera;
  final Function pickFromGallery;

  AddItem({this.pickFromCamera, this.pickFromGallery});

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.22)),
      ),
      margin: EdgeInsets.only(right: 10, top: 10),
      child: InkWell(
        onTap: () async {
          Widget camera = FlatButton(
            child: Text("Camera", textScaleFactor: 1),
            onPressed: widget.pickFromCamera,
          );
          Widget gallery = FlatButton(
            child: Text("Gallery", textScaleFactor: 1),
            onPressed: widget.pickFromGallery,
          );
          AlertDialog alert = AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text("Add a Photo", textScaleFactor: 1),
            content: Text("From where would you like to add a photo?", textScaleFactor: 1),
            actions: [
              camera,
              gallery,
            ],
          );
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            },
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppSettings.primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: null,
              ),
              Text(
                'Add Photo',
                textScaleFactor: 0.85,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
