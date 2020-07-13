import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/profile/dialog_edit.dart';
import 'package:fluttercoffee/src/shared/containercard.dart';

class InformationAccountPage extends StatefulWidget {
  final String email;
  final String imageURL;
  final String uid;
  final String userName;
  final String phoneNumber;
  const InformationAccountPage({Key key, this.email, this.imageURL, this.userName, this.phoneNumber, this.uid}) : super(key: key);

  @override
  _InformationAccountPageState createState() => _InformationAccountPageState();
}

class _InformationAccountPageState extends State<InformationAccountPage> {


  @override
  Widget build(BuildContext context) {
    setState(() {
      print(widget.userName);
    });
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              GestureDetector(
                onTap: ()=>showDialogg(context,widget.uid),
                child: Text("Change",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
              )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ContainerCard(
              child: Column(
                children: <Widget>[
                  ClipOval(
                    child: CachedNetworkImage(
                      width: 150,
                      height: 150,
                      imageUrl: widget.imageURL,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url,
                          downloadProgress) =>
                          CircularProgressIndicator(
                              value:
                              downloadProgress
                                  .progress),
                      errorWidget:
                          (context, url, error) =>
                          Icon(Icons.error),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(widget.userName,style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),),
                  SizedBox(
                    height: 10,
                  ),
                  Text(widget.email,style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),),

                ],
              ),
            ),

            const SizedBox(
              height: 50,
            ),
            Text("Basic Information",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),),
            const SizedBox(
              height: 20,
            ),
            ContainerCard(
              child: Column(
                children: <Widget>[
                 _buildInformation("Name", widget.userName),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildInformation("Email", widget.email),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildInformation("Phone Number",widget.phoneNumber.toString() ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInformation(String title,String detail){
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,

        ),),
        Text(detail,
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold
        ),),
      ],
    );
  }

   showDialogg(BuildContext context,String uid){
    return showDialog(context: context,builder: (_){
      return BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 7,
          sigmaY: 7
        ),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: DialogEdit(email: widget.email,userName: widget.userName,phoneNumber: widget.phoneNumber,uid: uid,),
        ),
      );
    });
  }
}
