import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/model/order.dart';

class OrderProvider with ChangeNotifier {
  List<Order> listOrder = List();
  bool isShowing = false;

  void showing(bool status){
    isShowing = status;
    notifyListeners();
  }

  addItem(Order order) {
    for (int i = 0; i < order.amount; i++) {
      listOrder.add(order);
    }
    for (Order order in listOrder) {
//        double price = double.parse(order.menu.price);
//        int amount = order.amount;
//        double total = price * amount;
//        print(total);

    }
    notifyListeners();
  }



}
