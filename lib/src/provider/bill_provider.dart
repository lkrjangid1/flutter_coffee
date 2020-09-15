
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/model/bill.dart';
import 'package:fluttercoffee/src/model/cart.dart';
import 'package:fluttercoffee/src/model/menu.dart';

class BillProvider extends ChangeNotifier{
  DatabaseReference databaseReference;
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  List<Bill> listBill = [];
  bool isLoading = false;

  Future<List<Bill>> getAllBill(int index) async {
    isLoading = true;
    listBill.clear();
    await firebaseDatabase
        .reference()
       .child('Order')
       .once()
        .then((DataSnapshot dataSnapshot) {
      Map<String, dynamic>.from(dataSnapshot.value).forEach((key, value) {
        List abc = value['product'];

        Bill bill = Bill(
          codeBill: value['codeBill'],
          dateTime: value['dateTime'].toString(),
          totalBill: value['totalBill'].toString(),
          listCart: abc.map((e) => Cart(
            menu: Menu(
              name: value['product'][index]['price']
            ),
            quantity: value['product'][index]['quantity'].toString(),
          )).toList(),
        );

        listBill.add(bill);
      });
    });
    isLoading = false;
    notifyListeners();
    return listBill;
  }
}