import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/card_page.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/categories_page.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/home_page.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/profile_page.dart';
import 'package:fluttercoffee/src/util/const.dart';

class DashboardScreenPage extends StatefulWidget {
  DashboardScreenPage({Key key}) : super(key: key);

  @override
  _DashboardScreenPageState createState() => _DashboardScreenPageState();
}

class _DashboardScreenPageState extends State<DashboardScreenPage> {
  int currentIndex = 0;
  List<Widget> listScreen = [
    HomePage(),
    CategoriesPage(),
    CardPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
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
            _buildBottomNavigationBarItem(Icons.shopping_cart, "Card"),
            _buildBottomNavigationBarItem(Icons.person, "Profile"),
          ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: listScreen,
      ),
    );
  }
}
_buildBottomNavigationBarItem(IconData iconData, String text) {
  return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        size: 27,
      ),
      title: Text(text,style: TextStyle(fontWeight: FontWeight.bold),));
}
