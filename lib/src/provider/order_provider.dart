import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttercoffee/src/model/order.dart';

class OrderProvider with ChangeNotifier {
  List<Order> listOrder = [];
  bool isShowing = false;
  double total = 0.0;
  List<String> listImageURL = List();
  StorageReference storageReference;
  int quality = 0;
  String dowloadURL = '';

  void showing(bool status){
    isShowing = status;
    notifyListeners();
  }

  Future<List<Order>> addItem(Order order1) async  {

     for (int i = 0; i < order1.amount; i++) {
      listOrder.add(order1);

      if (listOrder[i].menu.name != order1.menu.name) {
        print('trung');
      }
    }
    for(Order order in listOrder){
      int amount = listOrder.length;
      if (total == 0.0 ) {
        total = double.parse(order.menu.price);
      }  else{
        double price = double.parse(order.menu.price);
        total = price * amount;
      }

      if (order.menu.name == order1.menu.name) {

      }  else{
        print('cc');
      }
    }
    notifyListeners();
    return listOrder;
  }
//
//  Future getImage(List<Order>listOrdere) async {
//
//    for(Order order in listOrdere){
//
//
//      storageReference = FirebaseStorage.instance
//          .ref()
//          .child('menu/Cafe/${order.menu.image}');
//      dowloadURL = await storageReference.getDownloadURL();
//      listImageURL.add(dowloadURL);
//
//    }
//    print(listImageURL.length);
//  notifyListeners();
//  }
}
