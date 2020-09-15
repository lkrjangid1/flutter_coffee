
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttercoffee/src/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider with ChangeNotifier {
  DatabaseReference databaseReference;
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  StorageReference storageReference;
  String uid = '';
  User user;
  bool isLoading = false;

  Future<User> getUser(String uid) async {
    isLoading = true;
    var data =  await firebaseDatabase.reference().child('User').child(uid).once();
    var dataJson = data.value;
    user = User(
      userName: dataJson['userName'],
      image: dataJson['image'],
      email: dataJson['email'],
      phoneNumber: dataJson['phoneNumber'],

    );

    isLoading = false;
    notifyListeners();
    return user;
  }

  Future updateInformation(String uid,String userName, String phoneNumber) async {
    var data = await firebaseDatabase.reference().child('User').child(uid);
//    user.phoneNumber = phoneNumber;
//    user.userName = userName;
    data.update({
      'userName': userName
    });
    notifyListeners();
  }
  // thieu gmail, xac nhan sdt
// bỏ email đăng kí , ghi "Username" "Phone Number"


}