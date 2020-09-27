import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/dashboard.dart';
import 'package:fluttercoffee/src/page/dashboard/dashboard_page.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/profile/information_account_page.dart';
import 'package:fluttercoffee/src/provider/auth_provider.dart';
import 'package:fluttercoffee/src/provider/profile_provider.dart';
import 'package:fluttercoffee/src/shared/chooseimage.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:fluttercoffee/src/util/router_path.dart';
import 'package:fluttercoffee/src/util/sizeconfig.dart';
import 'package:provider/provider.dart';


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
class ProfilePageWidget extends StatelessWidget {
  final String uid;

  const ProfilePageWidget({Key key, this.uid}) : super(key: key);


  @override
  Widget build(BuildContext context) {
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
    Widget _buildItemSetting(int index,ProfileProvider value) {
      return ListTile(
        onTap: () {
          switch (index) {
            case 3:
              _buildDialog(context);

              break;
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => InformationAccountPage(
                      email: value.user.email,
                      imageURL: value.user.image,
                      userName: value.user.userName,
                      uid: uid,
                      phoneNumber: value.user.phoneNumber),
                ),
              );
              break;
            case 1:
              Navigator.pushNamed(context, HistoryPageeee);
             break;
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

    return Consumer<ProfileProvider>(
      builder: (BuildContext context, ProfileProvider value, Widget child) {
        value.getUser(uid);
        return Scaffold(
          body: Container(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: getScreenHeight(350),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: value.user.image.isEmpty ? AssetImage('assets/onboard/splash.png'): NetworkImage(value.user.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: getScreenHeight(350),
                        decoration: BoxDecoration(
                            color: kColorSplash.withOpacity(.3)
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: getScreenWith(16),vertical: getScreenHeight(25)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(value.user.userName == null ? "Null" : value.user.userName,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: getScreenWith(25),
                                  fontWeight: FontWeight.bold
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(value.user.email == null ? "Null" :  value.user.email,
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
                            return _buildItemSetting(index, value);
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
      },
    );
  }
   _buildDialog(BuildContext context,){
    return AwesomeDialog(context: context,dialogType: DialogType.WARNING,
    title: "Đăng xuất",
      desc: "Bạn có chắc muốn đăng xuất không?",
      btnCancelOnPress: (){

      },
        btnCancelText: "Huỷ",
      btnOkOnPress: (){
//        data.logOutUser();
        Navigator.pushReplacementNamed(context, LoginPage);
      },
      btnOkText: "Có"
   ).show();
  }
}
