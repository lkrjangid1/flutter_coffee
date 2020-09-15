import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/model/bill.dart';
import 'package:fluttercoffee/src/shared/containercard.dart';
import 'package:fluttercoffee/src/util/const.dart';

class DetailHistoryPage extends StatelessWidget {
  final Bill bill;
  const DetailHistoryPage({Key key, this.bill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int timeStamp = int.parse(bill.dateTime);
    var date = new DateTime.fromMillisecondsSinceEpoch(timeStamp);
    bill.listCart.forEach((element) {
      print(element.menu.name);
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorGreen,
        title: Column(
          children: <Widget>[
            Text("Bill "),
            Text(date.toString().substring(0,19),),],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Order code',
                style: TextStyle(
                  color: Colors.grey
                ),),
                Text( bill.codeBill.substring(1,10),
                style: TextStyle(
                  color: Colors.grey
                ),),
              ],
            ),

            const SizedBox(
              height: 20,
            ),
            Text(
              "Detail bill",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            ContainerCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListView.separated(
                    itemCount: bill.listCart.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, border: Border.all()),
                              child: Center(child: Text('2')),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text("Coffee Cold Brew"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 7),
                              child: Text("\$${bill.totalBill}"),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                  ),
                  Divider(

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Total",
                      style: TextStyle(
                        fontSize: 15
                      ),),
                      Text("\$${bill.totalBill}",
                      style: TextStyle(
                        fontSize: 20
                      ),)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
