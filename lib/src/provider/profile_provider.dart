
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttercoffee/src/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider with ChangeNotifier {
  String email = '';
  DatabaseReference databaseReference;
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  StorageReference storageReference;
  String uid = '';
  User user;

  Future<String> getValues() async  {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    email = sharedPrefs.getString('email');
//    uid = sharedPrefs.getString('uid');
    notifyListeners();
    return email;
  }

  Future<User> getUser(String uid) async {
    await firebaseDatabase.reference().child('User').child(uid).once().then((DataSnapshot dataSnapshot){
      var data = dataSnapshot.value;
     if (user == null) {
       user = User(
         userName: data['userName'],
         image: data['image'],
         email: data['email'],
         phoneNumber: data['phoneNumber'],
       );
     }
    });


    return user;
  }

}