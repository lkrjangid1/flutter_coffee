import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttercoffee/src/model/store.dart';
import 'package:fluttercoffee/src/service/share_pref.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class StoreProvider with ChangeNotifier {
  PermissionStatus _permissionGranted;
  Location location = Location();
  bool _serviceEnabled;
  DatabaseReference databaseReference;
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  StorageReference storageReference;
  LocationData locationData;
  String address;
  bool isLoading = false;
  BitmapDescriptor customIcon;
  List<Store> listStore = List();

  Future<void> checkPermissionLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    locationData = await location.getLocation();
    SharedPrefService.setDouble(key: 'latitude',value: locationData.latitude );
    SharedPrefService.setDouble(key: 'longitude',value: locationData.longitude );
    notifyListeners();
  }

  Future<List<Store>> getAllStore () async {
    var data =  await firebaseDatabase.reference().child('Store').once();
    Map<dynamic,dynamic>.from(data.value).forEach((key, value) {
      Store store = Store(
        image: value['Image'],
        latitude: value['Latitude'],
        longitude: value['Longitude'],
        name: value['Name'],
        phone: value['Phone'],
        closeTime: value['CloseTime'],
        opentTime: value['OpenTime'],
      );
      listStore.add(store);
    });
  return listStore;
  }


    Future<void>convertLatLnToLocation(double latitude,double longitude) async{
    var coordinates = await Coordinates(latitude, longitude);
    var  addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var  first = addresses.first;
    address = first.addressLine;
    return address;
  }



}
