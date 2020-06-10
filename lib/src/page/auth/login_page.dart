import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/provider/auth_provider.dart';
import 'package:fluttercoffee/src/shared/button.dart';
import 'package:fluttercoffee/src/shared/containertextform.dart';
import 'package:fluttercoffee/src/shared/logo.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:provider/provider.dart';

class LoginScreenPage extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final formState = GlobalKey<FormState>();

  @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: double.infinity,
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
                          top: 50,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Logo(),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,

                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Consumer<AuthProvider>(
                      builder: (BuildContext context, AuthProvider value, Widget child) {

                        return Form(
                          key: formState,
                          child: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: ContainerTextForm(
                                  child: TextFormField(
                                    controller: _emailController,
                                    onChanged: (value){

                                    },
                                    onSaved: (value){
                                      _emailController.text = value;
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "User Name",
                                        prefixIcon: Icon(Icons.person_outline)
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: ContainerTextForm(
                                  child: TextFormField(
                                    controller: _passwordController,
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
                                height: 50,
                                child: RaisedButton(
                                  color: kColorGreen,
                                  onPressed: () {
                                    _loginUser(value);
                                  },
                                  child: Text('Sign In ',
                                    style: TextStyle(
                                        color: Colors.white
                                    ),),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )

              ],
            ),
          ),
        );
      }
  void _loginUser(AuthProvider authProvider) {
    String email = _emailController.text;
    String password = _passwordController.text;
    if (formState.currentState.validate()) {
      if (email.isEmpty || password.isEmpty) {

      }else{
        authProvider.loginUser(_emailController.text, _passwordController.text);
      }
      formState.currentState.save();
    }

  }
}
