import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/provider/auth_provider.dart';
import 'package:fluttercoffee/src/shared/containertextform.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:provider/provider.dart';

class ChangePassPage extends StatelessWidget {
  final  passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<AuthProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset("assets/authen/authen2.png"),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text("Create new password ",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                ),),
            ),
            SizedBox(
              height: 10,
            ),
            Center(child:
              Text("Your new password must be different from previous used passwords")),
            SizedBox(
              height: 20,
            ),
            ContainerTextForm(
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                  hintText: "New Password",
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ContainerTextForm(
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Re Password",
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: RaisedButton(
                color: kColorGreen,
                onPressed: (){
                  data.changePassword(passwordController.text);
                },
                child: Text('Create',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),),
            ),

          ],
        ),
      ),
    );
  }
}