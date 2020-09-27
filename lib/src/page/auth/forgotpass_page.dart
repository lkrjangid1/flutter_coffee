import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/provider/auth_provider.dart';
import 'package:fluttercoffee/src/shared/containertextform.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:fluttercoffee/src/util/router_path.dart';
import 'package:provider/provider.dart';

class ForgoPassPage extends StatefulWidget {
  @override
  _ForgoPassPageState createState() => _ForgoPassPageState();
}

class _ForgoPassPageState extends State<ForgoPassPage> {
  final emailController = TextEditingController();

  bool isShowButton = false;

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<AuthProvider>(context,listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              IconButton(
                alignment: Alignment.topLeft,
                icon: Icon(Icons.arrow_back_ios,size: 18,),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset("assets/authen/authen3.png"),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text("Forgot your password",
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
                Text("Enter your register email bellow to receive password reset intrusction")),
              SizedBox(
                height: 20,
              ),
              ContainerTextForm(
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'abc@gmail.com'
                  ),
                  onChanged: (value){
                    if (value.isNotEmpty) {
                      setState(() {
                        isShowButton= true;
                      });
                    }else{
                      setState(() {
                        isShowButton = false;
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Visibility(
                visible: isShowButton,
                child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: RaisedButton(
                    color: kColorGreen,
                    onPressed: (){
                      data.forgotPassword(emailController.text);
                      Navigator.pushReplacementNamed(context, SucessPagee);
                    },
                    child: Text('Send',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
