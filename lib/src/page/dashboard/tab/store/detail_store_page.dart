import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/model/store.dart';
import 'package:fluttercoffee/src/provider/detail_store_provider.dart';
import 'package:fluttercoffee/src/shared/containercard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailStorePage  extends StatelessWidget {
  final Store store;

  const DetailStorePage({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: (BuildContext context) => DetailStoreProvider(),
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
    Provider.of<DetailStoreProvider>(context,listen: false).checkOpenCloseTime(store.closeTime,store.opentTime);

    return Consumer<DetailStoreProvider>(
      builder: (BuildContext context, DetailStoreProvider value, Widget child) {
        value.getImageStore(store.image);
        value.convertLatLnToLocation(store.latitude, store.longitude);
//        value.checkOpenCloseTime();


//        if(currentTime.isAfter(openTime) && currentTime.isBefore(closeTime)) {
//          print("a");
//          print(currentTime);
//        }

        return Scaffold(
          body: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            value.dowloadURl,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 200,left: 20,right: 20),
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          height: 130,
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
                                  fontSize: 25
                              ),),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
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
                              _buildInforAddress("5.5 km (Current location)", Icons.adjust),
                              const SizedBox(
                                height: 10,
                              ),

                            ],
                          ),
                          flex: 2,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Container(
                            height: 100,
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
                                  zoom: 15.0,
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

              Text("Detail "),
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
                                Text("Open Time"),
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
}
