import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/model/store.dart';
import 'package:fluttercoffee/src/provider/detail_store_provider.dart';
import 'package:fluttercoffee/src/shared/containercard.dart';
import 'package:fluttercoffee/src/util/sizeconfig.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailStorePage  extends StatelessWidget {
  final Store store;

  const DetailStorePage({Key key, this.store}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    DetailStoreProvider detailStoreProvider = DetailStoreProvider();

    return ChangeNotifierProvider.value(
      value: detailStoreProvider,
      child: DetailStorePageWidget(store: store,),
    );
  }
}


class DetailStorePageWidget extends StatelessWidget {
  final Store store;

  const DetailStorePageWidget({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Set<Marker> marker = Set();
    marker.add(
      Marker(
        markerId: MarkerId(store.name),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(store.latitude,store.longitude),
      )
    );
//    Provider.of<DetailStoreProvider>(context,listen: true).checkOpenCloseTime(store.closeTime,store.opentTime);
    Provider.of<DetailStoreProvider>(context,listen: false).convertLatLnToLocation(store.latitude, store.longitude);

    return Consumer<DetailStoreProvider>(
      builder: (BuildContext context, DetailStoreProvider value, Widget child) {

        value.checkOpenCloseTime(store.opentTime,store.closeTime);
        value.calDistance(store.latitude, store.longitude);

        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(bottom: getScreenHeight(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              width: double.infinity,
                              height: getScreenHeight(230),
                              imageUrl: store.image,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url,
                                  downloadProgress) =>
                                  CircularProgressIndicator(
                                      value:
                                      downloadProgress
                                          .progress),
                              errorWidget:
                                  (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            Positioned(
                              top: 50,
                              left: 15,
                              child: InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: buildIconToolBar(Icons.arrow_back_ios),
                              ),
                            ),
                          ],
                        ),
                      ),
                       SizedBox(
                        height: getScreenHeight(40),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: getScreenHeight(160),left: getScreenWith(15),right: getScreenWith(15)),
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            height: getScreenHeight(120),
                            decoration: BoxDecoration(
                              color: Colors.white,
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
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(store.name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: getScreenWith(25)
                                ),),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                   SizedBox(
                    height: getScreenHeight(17),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: getScreenHeight(10),vertical: getScreenWith(10)),
                    child: ContainerCard(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                _buildInforAddress(value.address, Icons.location_on),
                                const SizedBox(
                                  height: 10,
                                ),
                                _buildInforAddress("${value.km.toString()} km (Current location)", Icons.adjust),
                                const SizedBox(
                                  height: 10,
                                ),

                              ],
                            ),
                            flex: 2,
                          ),
                           SizedBox(
                            width: getScreenWith(15),
                          ),
                          Expanded(
                            child: Container(
                              height: getScreenHeight(80),
                              decoration: BoxDecoration(

                              ),
                              child: GoogleMap(
                                markers: marker,
                                compassEnabled: false,
                                zoomControlsEnabled: false,
                                mapToolbarEnabled: false,
                                zoomGesturesEnabled: false,
                                scrollGesturesEnabled: false,
                                myLocationButtonEnabled: false,
                                initialCameraPosition: CameraPosition(
                                    zoom: 2.0,
                                    target: LatLng(store.latitude, store.longitude)
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Detail "),
                ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ContainerCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(FontAwesomeIcons.clock,color: Colors.grey,size: 20,),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(value.time,
                                  style: TextStyle(
                                    color: value.color ? Colors.green : Colors.red,
                                    fontWeight: FontWeight.bold
                                  ),),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text("${store.opentTime + "-" + store.closeTime }"),
                                ],
                              )

                            ],
                          ),

                          Divider(height: 20,),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.phone,color: Colors.grey,size: 17,),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(store.phone.toString()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInforAddress(String title,IconData iconData){
    return    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(iconData,
          color: Colors.grey,size: 12,),

        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 13,
              ),
            )),
      ],
    );
  }
//Widget _buildDetailInfor
  buildIconToolBar(IconData icon){
      return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon,size: 16,color: Colors.white,),
      );
  }
}
