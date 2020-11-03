import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

open(BuildContext context, Widget widget) {
  Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context) => widget));
}

closeOpen(BuildContext context, Widget widget) {
  Navigator.of(context).pushReplacement(new CupertinoPageRoute(builder: (BuildContext context) => widget));
}

close(BuildContext context) {
  Navigator.pop(context);
}

closeDialog(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop('dialog');
}
