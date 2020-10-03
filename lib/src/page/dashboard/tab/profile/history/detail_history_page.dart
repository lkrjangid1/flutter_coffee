import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/model/bill.dart';
import 'package:fluttercoffee/src/model/cart.dart';
import 'package:fluttercoffee/src/model/menu.dart';
import 'package:fluttercoffee/src/shared/containercard.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:fluttercoffee/src/util/sizeconfig.dart';

class DetailHistoryPage extends StatelessWidget {
  final Bill bill;
  const DetailHistoryPage({Key key, this.bill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int timeStamp = int.parse(bill.dateTime);
    var date = new DateTime.fromMillisecondsSinceEpoch(timeStamp);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorGreen,
        title: Column(
          children: <Widget>[
            Text("Bill"),
            Text(
              date.toString().substring(0, 19),
              style: TextStyle(
                fontSize: getScreenHeight(15)
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        padding:  EdgeInsets.symmetric(horizontal: getScreenWith(5)),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
             SizedBox(
              height: getScreenHeight(15),
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

             SizedBox(
              height: getScreenHeight(15),
            ),
            Text(
              "Detail bill",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),

            Expanded(
              child: Padding(
                padding:  EdgeInsets.only(top: getScreenHeight(20),bottom: getScreenHeight(40)),
                child: ContainerCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: ListView.separated(
                          itemCount: bill.listCart.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            Cart cart = bill.listCart[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child:  InkWell(
                                onTap: (){
                                  print(cart.menu.name);
                                },
                                child: DetailBillItem(
                                  image: cart.menu.image,
                                  title:  cart.menu.name,
                                  quantity:  cart.quantity,
                                  price:  cart.menu.price,
                                ),
                              )
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider();
                          },
                        ),
                      ),
                      Divider(

                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Total",
                          style: TextStyle(
                            fontSize: getScreenWith(17),
                            fontWeight: FontWeight.bold
                          ),),
                          Text("\$${bill.totalBill}",
                          style: TextStyle(
                            fontSize: getScreenWith(20)
                          ),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailBillItem extends StatelessWidget {
  final String title;
  final int quantity;
  final String price;
  final String image;

  const DetailBillItem({Key key, @required this.title, @required this.quantity,@required this.price, @required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: getScreenWith(70),
          height: getScreenHeight(70),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover
              )
          ),
        ),
        SizedBox(
          width: getScreenWith(10),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(title,style: TextStyle(
                    color: Colors.black,
                    fontSize: getScreenWith(12),
                    fontWeight: FontWeight.bold
                ),),
              ),
              SizedBox(
                height: 5,
              ),
              Text("Số Lượng: $quantity",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: getScreenWith(10)
                ),)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 7),
          child: Text("\$$price"),
        )
      ],
    );

  }
}

