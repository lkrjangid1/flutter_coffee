import 'package:flutter/material.dart';

class Demotab extends StatefulWidget {

  @override
  _DemotabState createState() => _DemotabState();
}

class _DemotabState extends State<Demotab> {
  int currentIndex = 0;

  List<Widget> a = [
    List1("OOK1"),
    List1("OOK2"),
    List1("OOK3"),
    List1("OOK4"),

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
          children: a
      ),
    );
  }
}
class List1 extends StatelessWidget {
  final String tabKey;
  List1(this.tabKey);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemBuilder: (c, i) {
          return Container(
            //decoration: BoxDecoration(border: Border.all(color: Colors.orange,width: 1.0)),
            alignment: Alignment.center,
            height: 60.0,
            child: Text("$tabKey : List$i"),
          );
        },
        itemCount: 100);
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
