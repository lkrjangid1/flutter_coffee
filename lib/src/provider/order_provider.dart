import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttercoffee/src/model/order.dart';

class OrderProvider with ChangeNotifier {
  List<Order> listOrder = [];
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

  Future<List<Order>> addItem(Order order1) async  {
     for (int i = 0; i < order1.amount; i++) {
      listOrder.add(order1);
//      if (listOrder[i].menu.name == order1.menu.name) {
//          print(;)
//      }
    }
    for(Order order in listOrder){
      int amount = listOrder.length;
      if (total == 0.0 ) {
        total = double.parse(order.menu.price);
      }  else{
        double price = double.parse(order.menu.price);
        total = price * amount;
      }

      if (order1.menu.name == order.menu.name) {
//          quality = order1.amount ++ ;
//          print(quality);

//      print(order1.amount ++ );
      }  else{
        print('cc');
      }
    }
    notifyListeners();
    return listOrder;
  }

  Future purchase(List<Order>listOrder)  async {
    String key = firebaseDatabase.reference().push().key;
    databaseReference = await firebaseDatabase.reference().child('BillDetail').child(key);
    for(Order orderr in listOrder){

      Order order = Order(menu: orderr.menu,amount: orderr.amount);
      if (orderr.menu.name == order.menu.name) {
        databaseReference.set(order.toJson());
      }
    }

  }
}
