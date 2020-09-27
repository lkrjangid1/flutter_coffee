import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/provider/auth_provider.dart';
import 'package:fluttercoffee/src/shared/button.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:fluttercoffee/src/util/router_path.dart';
import 'package:fluttercoffee/src/util/sizeconfig.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:provider/provider.dart';


class OptionAuthPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/onboard/splash.png'),
              fit: BoxFit.cover
          ),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: kColorSplash.withOpacity(0.8),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: getScreenWith(10),vertical: getScreenHeight(20)),
                    width: getScreenWith(100),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Text("Little Coffee Shop",style: TextStyle(
                              letterSpacing: 1.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: getScreenWith(20)
                          ),),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: getScreenWith(20),vertical: getScreenHeight(20)),
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Button(
                      title: 'Sign In',
                      onTap: (){
                        Navigator.pushNamed(context, LoginPage);
                      },
                    ),
                     SizedBox(
                      height: getScreenHeight(10),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: getScreenHeight(40),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        color: Colors.blue,
                        onPressed: (){

                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.facebookF,
                              color: Colors.white,
                            ),
                             SizedBox(
                              width: getScreenHeight(20),
                            ),
                            Text(
                              "Sign in with Facebook",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                     SizedBox(
                      height: getScreenHeight(40),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, RegisterPage);
                      },
                      child: Text('Already have an account ? - Sign up',style: TextStyle(
                          color: Colors.white
                      ),),
                    ),
                      SizedBox(
                        height: 5,
                      ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, ForgotPassPagee);
                  },
                  child: Text('Forgot your password? - Receive',style: TextStyle(
                      color: Colors.white,
                  ),),
                )
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );

  }
}

