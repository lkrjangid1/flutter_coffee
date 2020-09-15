import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttercoffee/src/model/bill.dart';
import 'package:fluttercoffee/src/model/menu.dart';
import 'package:fluttercoffee/src/model/cart.dart';
import 'package:fluttercoffee/src/service/share_pref.dart';

class CartProvider with ChangeNotifier {
  List<Cart> listCart = [];
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

//  Future<List<Menu>> addItem(Menu menu,int  amount) async  {
//    listOrder.add(menu);
//    for (Menu menu in listOrder) {
//      double price = double.parse(menu.price);
////      SharedPrefService.setDouble(key: 'value', value: total);
////      total = await SharedPrefService.getDouble(key: 'value');
////      total = price * amount;
//    }
////     for (int i = 0; i < order1.amount; i++) {
////      listOrder.add(order1);
////      if (listOrder[i].menu.name == order1.menu.name) {
////          print(;)
////      }
////    }
////    for(Order order in listOrder){
////      int amount = listOrder.length;
////      if (total == 0.0 ) {
////        total = double.parse(order.menu.price);
////      }  else{
////        double price = double.parse(order.menu.price);
////        total = price * amount;
////      }
////
////      if (order1.menu.name == order.menu.name) {
////          quality = order1.amount ++ ;
////          print(quality);
////
////      print(order1.amount ++ );
////      }  else{
////        print('cc');
////      }
////    }
//    notifyListeners();
//    return listOrder;
//  }

  Future<void> purchase(List<Cart> listCartt,double totalBill)  async {
    String keyBill = firebaseDatabase.reference().push().key;
    databaseReference = await firebaseDatabase.reference().child('Order').child(keyBill);
    Bill bill = Bill(codeBill: listCartt.length.toString());

    final timestamp = DateTime.now().millisecondsSinceEpoch;
    databaseReference.set({
      'codeBill':keyBill,
      'totalBill':totalBill,
      'dateTime':timestamp,
      'product':listCartt.map((e) =>
      {
        "price":e.menu.price,
        "image":e.menu.image,
        "quantity":e.quantity,
        "menu":e.menu.name,
      }).toList(),
    });

    notifyListeners();

//    listOrder.forEach((element) {
//      Cart cart = Cart(menu: element,quantity: e)
//
//      Cart order = Cart(menu: element.m,amount: element.amount);
//      print(order.menu.name);
//      databaseReference.set(order.toJson());
//    });
//

  }

  void increment(String menuId,int quatity){
//    print(quatity);
//    int index = listCart.indexWhere((cartMenu) => cartMenu.menu.menuId == menu.menuId);
//    Cart cart =  listCart.firstWhere((element) => element.menu.menuId == menuId);
//    print(cart.menu.menuId);
//    if (cart != null) {
//      int quant1 = int.parse(cart.quantity);
//      quant1 = quatity;
//      print(quant1++);
//      listCart.removeWhere((element) => element.menu.menuId == menuId);
//
//    }


    notifyListeners();
  }

  void removeItem(int index) async {
    listCart.removeAt(index);
    notifyListeners();
  }

  Future addItemm(Menu menu) async  {
    int quantity = 1;
    int index = listCart.indexWhere((cartMenu) => cartMenu.menu.menuId == menu.menuId);
    if (index >= 0) {
//      print('trung');
//      quantity = int.parse(listCart[index].quantity)+ 1;
//      print(quantity);
    }else{
      listCart.add(Cart(menu: menu,quantity: quantity.toString()));
    }
    notifyListeners();
//    cart.lisCartMenu.add(menu);
//    for(var i in cart.lisCartMenu){
//      print(i.name);
//    }
//
//      listOrder.add(menu);
//      if (listCart.length == 0 ) {
//        listCart.add(Cart(menuId: menu.menuId,quantity: "1",price: menu.price));
//      }
//      notifyListeners();

//      return listOrder;
  }
}
