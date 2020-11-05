import 'package:buyer/utils/uatheme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function function;

  CustomButton({this.text, this.function, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: UATheme.screenWidth * .50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 5,
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
