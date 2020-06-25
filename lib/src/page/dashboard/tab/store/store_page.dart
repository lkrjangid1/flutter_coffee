import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/provider/store_provider.dart';
import 'package:fluttercoffee/src/shared/containercard.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:fluttercoffee/src/util/router_path.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';


class StorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StoreProvider(),
      child: StorePageWidget(),
    );
  }
}


class StorePageWidget extends StatelessWidget {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(15.6073661, 96.8696433),
    zoom: 3.9,
  );
  @override
  Widget build(BuildContext context) {
    Provider.of<StoreProvider>(context,listen: false).getAllStore();
    Provider.of<StoreProvider>(context,listen: false).checkPermissionLocation();
    Set<Marker> listMarker = Set();
    Provider.of<StoreProvider>(context,listen: false).createMarker(context);
    List<String> a  = List();
//    Provider.of<StoreProvider>(context,listen: false).convertLatLnToLocation()


    return  Consumer<StoreProvider>(
      builder: (BuildContext context, StoreProvider value, Widget child) {
        for (var i in value.listStore) {
          value.convertLatLnToLocation(i.latitude, i.longitude);
//          print(value.aaa.first);
         listMarker.add(
            Marker(
              markerId: MarkerId(i.name),
              onTap: (){
                Navigator.pushNamed(context, DetailStorePagee,arguments: i);
              },
              infoWindow: InfoWindow(
                title: "cc"
              ),
              icon: value.customIcon,
              position: LatLng(i.latitude, i.longitude),
            ),
          );
        }
//        print(value.address);
        return Scaffold(
          body: GoogleMap(
            markers: listMarker,
            mapType: MapType.normal,
            myLocationEnabled:  true ,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
//      floatingActionButton: FloatingActionButton.extended(
//        onPressed: _goToTheLake,
//        label: Text('To the lake!'),
//        icon: Icon(Icons.directions_boat),
//      ),

        );
      },
    );
  }


}
