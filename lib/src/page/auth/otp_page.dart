import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/util/const.dart';

class OtpPage extends StatelessWidget {
  final focus = FocusNode();
  final String phoneNumber;

   OtpPage({Key key, this.phoneNumber}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Widget _buidOTP() {
      return Container(
        width: 50,
        child: TextFormField(
          autofocus: true,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold

          ),
          textAlign: TextAlign.center,
          onChanged: (str) {
            if (str.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          decoration: InputDecoration(

            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: 20,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "OTP Verification",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Enter the OTP send to $phoneNumber",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  letterSpacing: .2),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buidOTP(),
                _buidOTP(),
                _buidOTP(),
                _buidOTP(),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't receive the OTP?",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "resend otp".toUpperCase(),
                  style: TextStyle(
                      color: kColorGreen,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: kColorGreen.withOpacity(.7),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(10, 10),
                      blurRadius: 10,
                      color: Colors.greenAccent.withOpacity(.4)),
                  BoxShadow(
                      offset: Offset(-3, 0),
                      blurRadius: 15,
                      color: Colors.greenAccent.withOpacity(.4))
                ],
              ),
              child: Center(child: Text("verify & proceed".toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                
              ),)),
            )
          ],
        ),
      ),
    );
  }

}

