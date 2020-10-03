import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttercoffee/src/provider/store_provider.dart';
import 'package:fluttercoffee/src/shared/containercard.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:fluttercoffee/src/util/router_path.dart';
import 'package:fluttercoffee/src/util/sizeconfig.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
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

class StorePageWidget extends StatefulWidget {
  // must be statefull, because move animation to current

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(15.6073661, 96.8696433),
    zoom: 2.9,
  );

  @override
  _StorePageWidgetState createState() => _StorePageWidgetState();
}

class _StorePageWidgetState extends State<StorePageWidget> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<StoreProvider>(context,listen: false).getAllStore();
  }
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png)).buffer.asUint8List();
  }

  Set<Marker> listMarker = {};

  Future<void> setIconSize(StoreProvider value) async {
    final Uint8List markerIcon = await getBytesFromAsset('assets/logo.png', 100);
    for (var i in value.listStore) {
      value.convertLatLnToLocation(i.latitude, i.longitude);

      listMarker.add(
        Marker(
          markerId: MarkerId(i.name),
          onTap: (){
            Navigator.pushNamed(context, DetailStorePagee,arguments: i);
          },
          infoWindow: InfoWindow(
              title: i.name
          ),
          icon: BitmapDescriptor.fromBytes(markerIcon) ,
          position: LatLng(i.latitude, i.longitude),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<StoreProvider>(context,listen: false);

    Provider.of<StoreProvider>(context,listen: false).checkPermissionLocation();

    return  Consumer<StoreProvider>(
      builder: (BuildContext context, StoreProvider value, Widget child) {
        setIconSize(value);

        return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () => goToLocation(value.locationData.latitude,value.locationData.longitude,13),
              backgroundColor: Colors.white,child: Icon(Icons.add,color: kColorGreen,),),
          body: Stack(
            children: [
              GoogleMap(
                myLocationButtonEnabled: false,
                markers: listMarker,
                mapType: MapType.normal,
                myLocationEnabled:  true ,
                zoomControlsEnabled: false,
                initialCameraPosition: StorePageWidget._kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      height: getScreenHeight(140),
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: value.listStore.map((e) => InkWell(
                          onTap: (){
                            goToLocation(e.latitude, e.longitude,17);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(4, 4),
                                    blurRadius: 10,
                                    color: Colors.grey.withOpacity(.3),
                                  ),
                                  BoxShadow(
                                    offset: Offset(-3, 0),
                                    blurRadius: 15,
                                    color: Color(0xffb8bfce).withOpacity(.1),
                                  )
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(e.image),
                                        fit: BoxFit.cover
                                      ),
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(e.name),
                                        Text("${e.opentTime} + ${e.closeTime}"),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )).toList(),
                      )
                    )
                ),
              )
            ],
          )
        );
      },
    );
  }

  


  Future<void> goToLocation(double latitude,double longitude,double zoom) async {
    final GoogleMapController controller = await _controller.future;

     final CameraPosition cameraPosition = CameraPosition(
        target: LatLng(latitude,longitude),
        zoom: zoom);


    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }
}


