import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/categories/categories_page.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/home/home_page.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/profile/profile_page.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/store/store_page.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:fluttercoffee/src/util/sizeconfig.dart';

class DashboardScreenPage extends StatefulWidget {

  String uid;
  DashboardScreenPage({Key key, this.uid}) : super(key: key);


  @override
  _DashboardScreenPageState createState() => _DashboardScreenPageState(uid);
}

class _DashboardScreenPageState extends State<DashboardScreenPage> {
   final String uid1;
   final key1 = GlobalKey();
   final key2 = GlobalKey();
   _DashboardScreenPageState(this.uid1);
  int currentIndex = 0;
  List<Widget> listScreen() => [
    HomeProvider1(uid: uid1,),
    CategoriesPage(),
    StorePage(),
    ProfilePage(key: key2,uid: uid1,
    ),
  ];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    final List<Widget> children = listScreen();

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0.0,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          unselectedItemColor: Colors.grey[400],
          selectedItemColor: kColorGreen,
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            _buildBottomNavigationBarItem(Icons.home,"Home"),
            _buildBottomNavigationBarItem(Icons.free_breakfast,"Categories"),
            _buildBottomNavigationBarItem(Icons.store, "Store"),
            _buildBottomNavigationBarItem(Icons.person, "Profile"),
          ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: children
      ),
    );
  }
}
_buildBottomNavigationBarItem(IconData iconData, String text) {
  return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        size: getScreenWith(22),
      ),
      title: Text(text,style: TextStyle(fontWeight: FontWeight.bold),));
}
