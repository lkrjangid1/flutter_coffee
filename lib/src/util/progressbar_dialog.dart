import 'package:flutter/material.dart';

class ProgressbarDialog{
  static  buildProgressBarDialog(BuildContext context,bool isLoading){
    return  isLoading ? Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ) : showDialog(
      context: context,
      builder: (_) =>
          AlertDialog(
            title: Row(
              children: <Widget>[
                CircularProgressIndicator(),
                const SizedBox(
                  width: 20,
                ),
                Text("Loading.....")
              ],
            ),
          ),
    );
  }
}