

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttercoffee/src/util/sizeconfig.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    int time = 800;
    int offset = 0;
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        offset += 5;
        time = 800 + offset;
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: getScreenWith(10)),
            child: Shimmer.fromColors(
              highlightColor: Colors.white,
              baseColor: Colors.grey[300],
              child: ShimmerLayout(),
              period: Duration(milliseconds: time),
            ));
      },
    );
  }
}

class ShimmerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    
    double containerWidth = getScreenWith(200);
    double containerHeight = 15;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 7.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: getScreenHeight(90),
            width: getScreenWith(80),
            color: Colors.grey,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: containerHeight,
                width: containerWidth,
                color: Colors.grey,
              ),
              SizedBox(height: 5),
              Container(
                height: containerHeight,
                width: containerWidth,
                color: Colors.grey,
              ),
              SizedBox(height: 5),
              Container(
                height: containerHeight,
                width: containerWidth ,
                color: Colors.grey,
              )
            ],
          )
        ],
      ),
    );
  }
}