import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/model/store.dart';
import 'package:fluttercoffee/src/service/share_pref.dart';
import 'package:geocoder/geocoder.dart';
import 'package:intl/intl.dart';
import 'package:latlong/latlong.dart';

class DetailStoreProvider with ChangeNotifier{
  DatabaseReference databaseReference;
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  StorageReference storageReference;
  String dowloadURl = '';
  String time = '';
  bool color = true;
  Distance distance = Distance();
  String address = '';
  double km ;

  Future<String>convertLatLnToLocation(double latitude,double longitude) async{
    var coordinates =  Coordinates(latitude, longitude);
    var  addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var  first = addresses.first;
     address  = first.addressLine;
     notifyListeners();
     return address;
  }

   checkOpenCloseTime(String openTimee,String closeTimee)  async {
    DateFormat dateFormat =  await DateFormat().add_Hm();
    DateTime now =  DateTime.now();
    DateTime open =  dateFormat.parse(openTimee);
    open =  DateTime(now.year, now.month, now.day, open.hour, open.minute);
    DateTime close =   dateFormat.parse(closeTimee);
    close =  DateTime(now.year, now.month, now.day, close.hour, close.minute);

    if(now.isAfter(open) && now.isBefore(close)) {
      time = 'Open Time';
      color = true;
      return true;
    }else{
      time = 'Close Time';
      color = false;
      return false;
    }
  }

  Future calDistance(double latitudee, double longitudee) async {
    double latitude = await SharedPrefService.getDouble(key: 'latitude');
    double longitude = await SharedPrefService.getDouble(key: 'longitude');

    km = distance.as(LengthUnit.Kilometer, LatLng(latitude, longitude),
        LatLng(latitudee, longitudee));

    notifyListeners();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

}