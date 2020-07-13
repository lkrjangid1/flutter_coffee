import 'package:flutter/cupertino.dart';
import 'package:fluttercoffee/src/model/menu.dart';

class DetailProvider with ChangeNotifier {
  int _count = 0;
  int get count => _count;
  double total = 0;
  bool isShowing = false;

  set count(int value) {
    _count = value;
    notifyListeners();
  }

  void increment(Menu menu) {
    count++;
    double price = double.parse(menu.price);
    total = price * count;
    isShowing = true;
    notifyListeners();
  }

  void decrement(Menu menu) {
    if (count == 0) {
      isShowing = false;
    } else {
      _count--;
      double price = double.parse(menu.price);
      total = price * count;
    }
    notifyListeners();
  }
}
