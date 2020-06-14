import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/util/const.dart';

class SnackBars {
  static buildMessage(BuildContext context, String message ){
    final showSnackBar = SnackBar(content: Text(message),
      duration: Duration(milliseconds: 1000),
      backgroundColor: kColorGreen,
    );
    Scaffold.of(context).showSnackBar(showSnackBar);
  }
}