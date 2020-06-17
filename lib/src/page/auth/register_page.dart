import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/provider/auth_provider.dart';
import 'package:fluttercoffee/src/shared/button.dart';
import 'package:fluttercoffee/src/shared/chooseimage.dart';
import 'package:fluttercoffee/src/shared/containertextform.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:fluttercoffee/src/util/progressbar_dialog.dart';
import 'package:provider/provider.dart';

class RegisterScreenPage extends StatefulWidget {

  static File image;

  @override
  _RegisterScreenPageState createState() => _RegisterScreenPageState();
}

class _RegisterScreenPageState extends State<RegisterScreenPage> {
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final numberPhoneController = TextEditingController();
  final formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print(RegisterScreenPage.image);
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
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
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
                        setState(() {

                        });
                      },
                      child: Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                            color: kColorGrey,
                            shape: BoxShape.circle
                        ),
                        child: decideImageView(),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
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
                    const SizedBox(
                      height: 20,
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
                    const SizedBox(
                      height: 20,
                    ),
                    ContainerTextForm(
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock_outline),
                          hintText: 'Password',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ContainerTextForm(
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock_outline),
                          hintText: 'Confirm Password',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
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
                    const SizedBox(
                      height: 50,
                    ),
                    Button(
                        title: 'Sign Up', onTap: () {
                    _signUp(value);

                    }
                    )
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
    if (RegisterScreenPage.image == null) {
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
            RegisterScreenPage.image,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }

  void _signUp(AuthProvider value){
      String email = emailController.text;
      String password = passwordController.text;
      String phoneNumber = numberPhoneController.text;
      String userName = userNameController.text;
      value.registerUser(email, password, phoneNumber, userName, RegisterScreenPage.image );
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
