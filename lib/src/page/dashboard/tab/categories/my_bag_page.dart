import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/model/order.dart';
import 'package:fluttercoffee/src/util/dowloadimage.dart';

class MyBagPage extends StatelessWidget {
  final List<Order> listOrder;

  const MyBagPage({Key key, this.listOrder}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("My Bag ",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),),
            const SizedBox(
              height: 15,
            ),
            Divider(
              thickness: 1.0,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: listOrder.length,
              itemBuilder: (BuildContext context, int index) {
                DowloadImg.getImage('Cafe', listOrder[index].menu.image);

                return Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CachedNetworkImage(
                            width: 110,
                            height: 110,
                            imageUrl: DowloadImg.downloadUrl,
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
                        ],
                      ),

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(listOrder[index].menu.name),
                              const SizedBox(
                                height: 50,
                              ),
                              Text("\$${listOrder[index].menu.price}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,

                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey[300],
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text("1x"),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },)
          ],
        ),
      ),
    );
  }
}
