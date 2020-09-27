import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttercoffee/src/model/bill.dart';
import 'package:fluttercoffee/src/model/menu.dart';
import 'package:fluttercoffee/src/model/cart.dart';
import 'package:fluttercoffee/src/service/share_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  List<Cart> listCart = [];
  bool isLoading = false;
  int couter;
  double total = 0.0;
  DatabaseReference databaseReference;
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  List<String> listImageURL = List();
  StorageReference storageReference;
  String dowloadURL = '';

  void isLoadingg(bool status){
    isLoading = status;
    notifyListeners();
  }


  Future<void> purchase(List<Cart> listCartt,double totalBill)  async {
    isLoading = true;
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
    isLoading = false;

    listCart.clear();
    notifyListeners();
  }

  void increment(Cart cart){
      cart.increment();
    notifyListeners();
  }
  void decrement(Cart cart){
    cart.decrement();
    notifyListeners();
  }

  void removeItem(int index) async {
    listCart.removeAt(index);
    notifyListeners();
  }

  Future<bool> addItemm(Menu menu) async  {
    int quantity = 1;
    int index = listCart.indexWhere((cartMenu) => cartMenu.menu.menuId == menu.menuId);
    if (index >= 0) {
      return true;
    }
    listCart.add(Cart(menu: menu,quantity: quantity));
    notifyListeners();
  }

  Future<void> saveCart() async{
    final json = jsonEncode(listCart.map((e) => e.toJson()).toList());
    SharedPrefService.setString(key: 'listCart',value:  json);
  }
  Future<void> getCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringCart = prefs.getString('listCart');
    if (stringCart == null) {

    } else {
      final json = jsonDecode(stringCart);
     var a =  Cart.fromJson(json);
     print(a.quantity);
    }

  }

}
