import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/provider/profile_provider.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:provider/provider.dart';

class DialogEdit extends StatelessWidget {
  final String email;
  final String userName;
  final String phoneNumber;
  final String uid;

  const DialogEdit({Key key, this.email, this.userName, this.phoneNumber, this.uid}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileProvider>(
      create: (BuildContext context) => ProfileProvider(),
      child: DialogEditWidget(email: email,userName: userName,phoneNumber: phoneNumber,uid: uid,),
    );
  }
}


class DialogEditWidget extends StatelessWidget {
  final String email;
  final String userName;
  final String phoneNumber;
  final String uid;

  const DialogEditWidget({Key key, this.email, this.userName, this.phoneNumber, this.uid}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final userNameController = TextEditingController();
    final phoneNumberController = TextEditingController();
    final emailController = TextEditingController();
    final data =    Provider.of<ProfileProvider>(context,listen: false);

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(color: Colors.white,
      borderRadius: BorderRadius.circular(20)),
      child: Form(
        child: Column(
          children: <Widget>[
            Text(
              "Edit Information",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: userNameController..text = userName,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: emailController..text = email,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: phoneNumberController..text = phoneNumber,
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 160,
              child: RaisedButton(
                onPressed: () {
                  data.updateInformation(uid, userNameController.text, phoneNumberController.text);
                  Navigator.of(context).pop(userNameController.text);
                },
                color: kColorGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),

                ),
                child: Text(
                  "Change",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
