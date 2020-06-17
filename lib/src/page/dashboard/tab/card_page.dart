import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/util/const.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child:  Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: 10, itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
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
                              color: Colors.white
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 100,
                                height: 150,
                                decoration: BoxDecoration(
                                    color: Colors.brown,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    )
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Cofffe",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22
                                        ),),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Some",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      Text("\$44.0",style: TextStyle(
                                          color: kColorGreen,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15
                                      ),)
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10,top: 10),
                                child: Icon(Icons.close,
                                  size: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
              },
              ),
            ),
           Padding(
             padding: const EdgeInsets.all(10),
             child: Column(
               children: <Widget>[
                 _buildPay("Order ", "33"),
                 const SizedBox(
                   height: 7,
                 ),
                 _buildPay('Delivery', "0.0"),
                 const SizedBox(
                   height: 15,
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Text("Total",style: TextStyle(
                         color: Colors.black,
                         fontWeight: FontWeight.bold,
                       fontSize: 17
                     ),),
                     Text("55",
                       style: TextStyle(
                           color: Colors.black,
                           fontWeight: FontWeight.bold,
                         fontSize: 17
                       ),)
                   ],
                 ),
                 SizedBox(
                   width: 200,
                   child: RaisedButton(
                     color: kColorGreen,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10),

                     ),
                        child: Text(
                          "Secure Checkout",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {},
                      ),
                 ),
               ],
             ),
           )

          ],
        )
      ),
    );
  }
  _buildPay(String title,String price){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(title,
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),),
        Text(price,
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),),
      ],
    );
  }
}
