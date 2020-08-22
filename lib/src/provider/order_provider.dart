import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttercoffee/src/model/menu.dart';
import 'package:fluttercoffee/src/model/order.dart';
import 'package:fluttercoffee/src/service/share_pref.dart';

class OrderProvider with ChangeNotifier {
  List<Menu> listOrder = [];
  bool isShowing = false;
  double total = 0.0;
  DatabaseReference databaseReference;
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  List<String> listImageURL = List();
  StorageReference storageReference;

  String dowloadURL = '';

  void showing(bool status){
    isShowing = status;
    notifyListeners();
  }

  Future<List<Menu>> addItem(Menu menu,int  amount) async  {
    listOrder.add(menu);
    for (Menu menu in listOrder) {
      double price = double.parse(menu.price);
//      SharedPrefService.setDouble(key: 'value', value: total);
//      total = await SharedPrefService.getDouble(key: 'value');
//      total = price * amount;
    }
//     for (int i = 0; i < order1.amount; i++) {
//      listOrder.add(order1);
//      if (listOrder[i].menu.name == order1.menu.name) {
//          print(;)
//      }
//    }
//    for(Order order in listOrder){
//      int amount = listOrder.length;
//      if (total == 0.0 ) {
//        total = double.parse(order.menu.price);
//      }  else{
//        double price = double.parse(order.menu.price);
//        total = price * amount;
//      }
//
//      if (order1.menu.name == order.menu.name) {
//          quality = order1.amount ++ ;
//          print(quality);
//
//      print(order1.amount ++ );
//      }  else{
//        print('cc');
//      }
//    }
    notifyListeners();
    return listOrder;
  }

  Future purchase(List<Order>listOrder)  async {
//    print(listOrder.length);
//    String keyBillDetail = firebaseDatabase.reference().push().key;
//    String keyBill = firebaseDatabase.reference().push().key;
//
//    databaseReference = await firebaseDatabase.reference().child('BillDetail').child(keyBillDetail).child(keyBill);
//
//    listOrder.forEach((element) {
//      Order order = Order(menu: element.menu,amount: element.amount);
//      print(order.menu.name);
//      databaseReference.set(order.toJson());
//    });
//


  }
}
