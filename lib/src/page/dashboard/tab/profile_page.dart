import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/dashboard.dart';
import 'package:fluttercoffee/src/page/dashboard/dashboard_page.dart';
import 'package:fluttercoffee/src/provider/auth_provider.dart';
import 'package:fluttercoffee/src/provider/profile_provider.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  final String uid;

  const ProfilePage({Key key, this.uid}) : super(key: key);




  @override
  _ProfilePageState createState() => _ProfilePageState(uid);
}

class _ProfilePageState extends State<ProfilePage> {
  final String uid;
  _ProfilePageState(this.uid);


  List<IconData> listIcon = [
    Icons.person,
    Icons.history,
    Icons.settings
  ];

  List<String> listTitle = [
    'Information Accout',
    'History',
    "Setting"
  ];

  String email = '';
  String name = '';
  String imageURL = '';

  void getInformation () async{
    var data =   Provider.of<ProfileProvider>(context,listen: false);
    await  data.getUser(uid);
    email = data.user.email;
    name = data.user.userName;
    imageURL = data.user.image;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInformation();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageURL),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .5,
                    decoration: BoxDecoration(
                      color: kColorSplash.withOpacity(.3)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(name == null ? "Null" : name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(email == null ? "Null" : email,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),

                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white)
                              ),
                              child: Icon(Icons.camera_alt,
                                color: Colors.white,),

                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                  ),
                ),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListView.builder(
                      itemCount: listTitle.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return _buildItemSetting(index);
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildItemSetting(int index ){
    return ListTile(
      onTap: (){

      },
      leading: Icon(listIcon[index]),
      title: Text(listTitle[index]),
    );
  }
}
