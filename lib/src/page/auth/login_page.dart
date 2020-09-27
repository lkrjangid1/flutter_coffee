import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttercoffee/src/provider/auth_provider.dart';
import 'package:fluttercoffee/src/shared/button.dart';
import 'package:fluttercoffee/src/shared/containertextform.dart';
import 'package:fluttercoffee/src/shared/logo.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:fluttercoffee/src/util/progressbar_dialog.dart';
import 'package:fluttercoffee/src/util/router_path.dart';
import 'package:fluttercoffee/src/util/showsnackbars.dart';
import 'package:fluttercoffee/src/util/sizeconfig.dart';
import 'package:provider/provider.dart';

class LoginScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>AuthProvider(),
      child: LoginScreenPageWidget(),
    );
  }
}


class LoginScreenPageWidget extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final formState = GlobalKey<FormState>();
  final scaffoldState = GlobalKey<ScaffoldState>();

  @override
      Widget build(BuildContext context) {
        return Scaffold(
          key: scaffoldState,
          body: Container(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: getScreenHeight(300),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/signin.png',),
                      fit: BoxFit.cover
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[

                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: kColorSplash.withOpacity(.5),
                        ),
                      ),
                      Positioned(
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios,
                            color: Colors.white,),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        top: getScreenHeight(30),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Logo(),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: getScreenHeight(20),
                ),
                Consumer<AuthProvider>(
                  builder: (BuildContext context, AuthProvider value, Widget child) {
                    return value.isLoading ? ProgressbarDialog.buildProgressBarDialog(context, value.isLoading) : Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Form(
                          key: formState,
                          child: Column(
                            children: <Widget>[
                               SizedBox(
                                height: getScreenHeight(15),
                              ),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: getScreenHeight(15)),
                                child: ContainerTextForm(
                                  child: TextFormField(
                                    controller: _emailController..text = "d@gmail.com",
                                    onChanged: (value){

                                    },

                                    onSaved: (value){
                                      _emailController.text = value;
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Email",

                                        prefixIcon: Icon(Icons.person_outline)
                                    ),
                                  ),
                                ),
                              ),
                               SizedBox(
                                height: getScreenHeight(20),
                              ),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: getScreenHeight(15)),
                                child: ContainerTextForm(
                                  child: TextFormField(
                                    controller: _passwordController..text = "123456",
                                    obscureText: true,
                                    onSaved: (value){
                                      _passwordController.text = value;
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        prefixIcon: Icon(Icons.lock_outline)
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: double.infinity,
                                height: getScreenHeight(45),
                                child: RaisedButton(
                                  color: kColorGreen,
                                  onPressed: () {
                                    _loginUser(value,context);
                                  },
                                  child: Text('Sign In ',
                                    style: TextStyle(
                                        color: Colors.white
                                    ),),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )

              ],
            ),
          ),
        );
      }

  void _loginUser(AuthProvider authProvider,BuildContext context)  async {
    authProvider.isLoadingg(true);
    String email = _emailController.text;
    String password = _passwordController.text;
    if (formState.currentState.validate()) {
      if (email.isEmpty || password.isEmpty) {
        SnackBars.buildMessage(context, "Should not be empty");
        authProvider.isLoadingg(false);
      } else {
        var res = await authProvider.loginUser(
            _emailController.text, _passwordController.text);
        if (res is bool) {
          Navigator.pushReplacementNamed(context, DashBoardPage,
              arguments: authProvider.uid);
          authProvider.isLoadingg(false);
        } else {
          SnackBars.buildMessage(context, authProvider.authError);
        }
      }
    }

  }
}
