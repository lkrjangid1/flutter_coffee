import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/shared/containercard.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:fluttercoffee/src/util/router_path.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kColorGreen,
        title: Text("History Order "),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        child: ListView.builder(
          itemCount: 15,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: InkWell(
                onTap: (){
                  Navigator.pushNamed(context, DetailHistoryPagee);
                },
                child: ContainerCard(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.label_outline),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "43123143432",
                              style: TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text("Completed",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold
                              ),),
                            const SizedBox(
                              height: 8,
                            ),
                            Text("10:10 - 21/06/2020")

                          ],
                        ),
                      ),

                      Text("\$55.00",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),),
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ),
    );
  }
}
