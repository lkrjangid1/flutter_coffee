import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:fluttercoffee/src/util/router_path.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        width: double.infinity,
        child: Column(
          
          children: [
            const SizedBox(
              height: 80,
            ),

            Image.asset('assets/authen/authen1.png'),
            Text("Check your email",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),),
            Text("We have send a password recovery instruction to your email",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 13
            ),),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                color: kColorGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: (){
                  Navigator.pushReplacementNamed(context, ChangePassPagee);
                },
                child: Text("OK",
                style: TextStyle(
                  color: Colors.white,

                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
