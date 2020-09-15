import 'package:flutter/material.dart';

class EmptyHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Image.asset('assets/emptybill.png',fit: BoxFit.cover,),
            Text("Chưa có hoá đơn nào",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22
            ),)
          ],
        ),
      ),
    );
  }
}
