
import 'package:flutter/material.dart';

class SizeConfig{
  static  MediaQueryData mediaQueryData;
  static double sizeWith;
  static  double sizeHeight;

  void init(BuildContext context){
    mediaQueryData =MediaQuery.of(context);
    sizeWith = mediaQueryData.size.width;
    sizeHeight = mediaQueryData.size.height;
  }
}

double getScreenHeight(double inputHeight){
  double screenHeight = SizeConfig.sizeHeight;
  //812 height designer use
  return (inputHeight / 812.0) * screenHeight;
}

double getScreenWith(double inputWith){
  double screenWith = SizeConfig.sizeWith;
  return (inputWith / 375.0 ) * screenWith;
}