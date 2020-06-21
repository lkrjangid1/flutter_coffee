import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/dashboard.dart';
import 'package:fluttercoffee/src/page/dashboard/dashboard_page.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/profile/information_account_page.dart';
import 'package:fluttercoffee/src/provider/auth_provider.dart';
import 'package:fluttercoffee/src/provider/profile_provider.dart';
import 'package:fluttercoffee/src/shared/chooseimage.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:fluttercoffee/src/util/router_path.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  final String uid;
  const ProfilePage({Key key, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (_) => ProfileProvider(),
      child: ProfilePageWidget(uid: uid,),
    );
  }
}


class ProfilePageWidget extends StatefulWidget {

  final String uid;
  const ProfilePageWidget({Key key, this.uid}) : super(key: key);

  @override
  _ProfilePageStateWidget createState() => _ProfilePageStateWidget(uid);
}

class _ProfilePageStateWidget extends State<ProfilePageWidget> {
  final String uid;

  _ProfilePageStateWidget(this.uid);
  List<IconData> listIcon = [
    Icons.person,
    Icons.history,
    Icons.settings,
    Icons.call_missed_outgoing
  ];

  List<String> listTitle = [
    'Information Account',
    'History',
    "Setting",
    'Log Out'

  ];
  String email = '';
  String name = '';
  String imageURL = '';

  String phoneNumber = '';


   void getInformation () async{
    var data = Provider.of<ProfileProvider>(context,listen: false);
    await  data.getUser(uid);
    email = data.user.email;
    name = data.user.userName;
    phoneNumber = data.user.phoneNumber;
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
     var data = Provider.of<AuthProvider>(context,listen: true);
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
                  fit: BoxFit.fitHeight,
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
                        return _buildItemSetting(index,data);
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

  Widget _buildItemSetting(int index, AuthProvider data) {
    return ListTile(
      onTap: () {
        switch (index) {
          case 3:
            data.logOutUser();
            Navigator.pushReplacementNamed(context, LoginPage);
            break;
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => InformationAccountPage(
                    email: email,
                    imageURL: imageURL,
                    userName: name,
                    uid: uid,
                    phoneNumber: phoneNumber),
              ),
            );
        }
      },
      leading: Icon(listIcon[index]),
      title: Text(listTitle[index]),
    );
  }

  _openChoiceImage(BuildContext context){
    return showModalBottomSheet(context: context, builder: (_){
      return ChooseImage();
    });
  }

}
