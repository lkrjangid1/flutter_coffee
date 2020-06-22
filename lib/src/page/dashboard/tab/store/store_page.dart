import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/provider/store_provider.dart';
import 'package:fluttercoffee/src/shared/containercard.dart';
import 'package:fluttercoffee/src/util/const.dart';
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
    zoom: 3.0,
  );

  @override
  Widget build(BuildContext context) {
    Provider.of<StoreProvider>(context,listen: false).checkPermissionLocation();
    return  Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }


}
