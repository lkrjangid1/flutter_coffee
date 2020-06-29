import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/model/order.dart';

class OrderProvider with ChangeNotifier {
  List<Order> listOrder = List();
  bool isShowing = false;
  double total = 0.0;
  int quality = 0;

  void showing(bool status){
    isShowing = status;
    notifyListeners();
  }

  addItem(Order order1) {
    listOrder.clear();
    for (int i = 0; i < order1.amount; i++) {
      listOrder.add(order1);
    }

    for(Order order in listOrder){
      int amount = listOrder.length;
      if (total == 0.0 ) {
//        print('vo ne');
        total = double.parse(order.menu.price);
      }  else{
        double price = double.parse(order.menu.price);
        total = price * amount;
      }

      if (order.menu.name == order1.menu.name) {
//        print( listOrder[listOrder.indexOf(order)].amount++);
//      print(order.menu.name);
      }  else{
        print('cc');
      }
    }

    notifyListeners();
  }



}
