import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/provider/auth_provider.dart';
import 'package:fluttercoffee/src/shared/button.dart';
import 'package:fluttercoffee/src/shared/chooseimage.dart';
import 'package:fluttercoffee/src/shared/containertextform.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:fluttercoffee/src/util/progressbar_dialog.dart';
import 'package:fluttercoffee/src/util/router_path.dart';
import 'package:fluttercoffee/src/util/sizeconfig.dart';
import 'package:provider/provider.dart';

class RegisterScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AuthProvider(),
      child: RegisterScreenPageWidget()
    );
  }
}


class RegisterScreenPageWidget extends StatefulWidget {

  static File image;

  @override
  _RegisterScreenPageWidgetState createState() => _RegisterScreenPageWidgetState();
}

class _RegisterScreenPageWidgetState extends State<RegisterScreenPageWidget> with WidgetsBindingObserver {
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final numberPhoneController = TextEditingController();
  final formState = GlobalKey<FormState>();

//
//@override
//  void didChangeAppLifecycleState(AppLifecycleState state) {
//    // TODO: implement didChangeAppLifecycleState
//    super.didChangeAppLifecycleState(state);
//    if (state == AppLifecycleState.paused) {
//      print('pause');
//    }  else if (state == AppLifecycleState.resumed) {
//      print('a');
//    }
//  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios,
          color: Colors.black,),),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Sign Up',style: TextStyle(
          color: Colors.black
        ),),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: getScreenWith(20),vertical: getScreenHeight(20)),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: Form(
            key: formState,
            child: Consumer<AuthProvider>(
              builder: (BuildContext context, AuthProvider value, Widget child) {
                return Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () async{
                        await _openChoiceImage(context);

                      },
                      child: Container(
                        width: getScreenWith(180),
                        height: getScreenHeight(150),
                        decoration: BoxDecoration(
                            color: kColorGrey,
                            shape: BoxShape.circle
                        ),
                        child: decideImageView(),
                      ),
                    ),
                     SizedBox(
                      height: getScreenHeight(30),
                    ),
                    ContainerTextForm(
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email)
                        ),
                      ),
                    ),
                     SizedBox(
                      height: getScreenHeight(20),
                    ),
                    ContainerTextForm(
                      child: TextFormField(
                        controller: userNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person_outline),
                          hintText: 'User Name',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getScreenHeight(20),
                    ),
                    ContainerTextForm(
                      child: TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock_outline),
                          hintText: 'Password',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getScreenHeight(20),
                    ),
                    ContainerTextForm(
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock_outline),
                          hintText: 'Confirm Password',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getScreenHeight(20),
                    ),
                    ContainerTextForm(
                      child: TextFormField(
                        controller: numberPhoneController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.phone),
                          hintText: 'Number Phone ',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getScreenHeight(40),
                    ),
                    Button(
                        title: 'Sign Up',
                        onTap: ()  {
                           signUp(value);
//                          Navigator.pushReplacementNamed(context, OTPPagee,arguments: numberPhoneController.text);
                        }),
                  ],
                );
              },
            ),
          ),
        ),
      ),

    );
  }

  _openChoiceImage(BuildContext context){

    return showModalBottomSheet(context: context, builder: (_){
      return ChooseImage();
    });

  }
  Widget decideImageView() {
    if (RegisterScreenPageWidget.image == null) {
      return Icon(Icons.camera_alt,
      size: 50,color: Colors.white,);
    } else {
      return Container(

        decoration: BoxDecoration(
            color: kColorGrey,
          shape: BoxShape.circle
        ),
        child: ClipOval(
          child: Image.file(
            RegisterScreenPageWidget.image,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }

  Future<void> signUp(AuthProvider value){
      String email = emailController.text;
      String password = passwordController.text;
      String phoneNumber = numberPhoneController.text;
      String userName = userNameController.text;
//      value.registerUser(email, password, phoneNumber, userName, RegisterScreenPageWidget.image);

//      value.sendCodeToPhoneNumber(phoneNumber);
      value.isLoadingg(false);
      ProgressbarDialog.buildProgressBarDialog(context,  value.isLoading);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    numberPhoneController.dispose();
    userNameController.dispose();

  }

}
