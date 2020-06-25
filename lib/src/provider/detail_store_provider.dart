import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/model/store.dart';
import 'package:geocoder/geocoder.dart';
import 'package:intl/intl.dart';

class DetailStoreProvider with ChangeNotifier{
  DatabaseReference databaseReference;
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  StorageReference storageReference;
  String dowloadURl = '';
  String address = '';

  Future<String> getImageStore(String urlImage) async {
    storageReference = FirebaseStorage.instance
        .ref()
        .child('store/$urlImage');
   dowloadURl =  await storageReference.getDownloadURL();
   return dowloadURl;
  }


  Future<void>convertLatLnToLocation(double latitude,double longitude) async{
    final coordinates =  Coordinates(latitude, longitude);
    var  addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var  first = addresses.first;
     address  = first.addressLine;
     notifyListeners();
  }

  Future checkOpenCloseTime(String openTimee,String closeTimee)  async {
//    DateFormat dateFormat =  DateFormat();

//    DateTime now = DateTime.now();
    DateTime newDateTimeObj = await DateFormat().add_Hm().parse("10:07");
    newDateTimeObj = new DateTime(newDateTimeObj.year, newDateTimeObj.month, newDateTimeObj.day, newDateTimeObj.hour, newDateTimeObj.minute);
//    DateTime close = dateFormat.parse("15:30");
//    close = new DateTime(now.year, now.month, now.day, close.hour, close.minute);
      print(newDateTimeObj);
//    DateTime dateTime = await DateTime(0,0,0,newDateTimeObj.hour,newDateTimeObj.minute,0,0);
//    print(dateTime);

//
//    var  currentTime = await DateTime.now();
//
//    DateTime openTime  = DateTime.;
//    DateTime closeTime = DateTime.parse(closeTimee);

//    var b = dateFormat.format(openTime);
//    var c = dateFormat.format(closeTime);
//    var a = dateFormat.format(currentTime);
//    print(a);

//    print(currentTime);
//    if (currentTime.isAfter(openTime) && currentTime.isBefore(closeTime)) {
//      // do something
//      print('ab ');
//    }
    notifyListeners();
  }
}