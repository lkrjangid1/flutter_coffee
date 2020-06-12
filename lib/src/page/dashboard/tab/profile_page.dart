import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/provider/profile_provider.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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

  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
    var data  =   Provider.of<ProfileProvider>(context,listen: false);
    await data.getValues();
    print(data.email);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/onboard/splash.png'),
                fit: BoxFit.cover,
            ),

        ),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .5,
              decoration: BoxDecoration(
                color: kColorSplash.withOpacity(.5),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Perkakdckdccnakn",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("s",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
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
