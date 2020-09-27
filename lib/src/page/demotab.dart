import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Demotab extends StatefulWidget {

  @override
  _DemotabState createState() => _DemotabState();
}

class _DemotabState extends State<Demotab> {
  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.red,
        ),
        child: FadeInImage.assetNetwork(placeholder: 'assets/authen/authen1.png' , image: 'http://via.placeholder.com/350x150'),
//        CachedNetworkImage(
//          imageUrl: "http://via.placeholder.com/350x150",
//          placeholder: (context, url) => CircularProgressIndicator(),
//          errorWidget: (context, url, error) => Icon(Icons.error),
//        ),

      )
    );
  }
}
