import 'package:flutter/cupertino.dart';
import 'package:fluttercoffee/src/model/menu.dart';

class DetailProvider with ChangeNotifier {
  int count = 0;
  double total = 0;


  void increment(Menu menu) {
    count++;
    double price = double.parse(menu.price);
    total = price * count;
    notifyListeners();
  }

  void decrement(Menu menu) {
    if (count == 0) {
      count = 0;
    } else {
      count--;
      double price = double.parse(menu.price);
      total = price * count;
    }
    notifyListeners();
  }
}
