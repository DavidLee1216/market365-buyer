import 'package:buyer/utils/appsettings.dart';
import 'package:buyer/utils/uatheme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function function;
  final bool showShadow;

  CustomButton({this.text, this.function, this.color, this.showShadow});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 45,
      width: UATheme.screenWidth * .45,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: color!=null ? color:AppSettings.primaryColor, boxShadow: [
        showShadow != null && !showShadow
            ? BoxShadow(blurRadius: 0, spreadRadius: 0)
            : BoxShadow(
                color: color!=null ?  color.withOpacity(0.2):AppSettings.primaryColor.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 5),
              )
      ]),
      child: InkWell(
        onTap: function,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
          textScaleFactor: 0.9,
        ),
      ),
    );
  }
}
