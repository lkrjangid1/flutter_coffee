import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/model/menu.dart';
import 'package:fluttercoffee/src/provider/detail_provider.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:provider/provider.dart';

class DetailHomePage extends StatelessWidget {
  final Menu menu;
  final String image;

  const DetailHomePage({Key key , @required this.image, this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<DetailProvider>(context,listen: true);
    print(data.count);

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(

        ),
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 30,
                    ),
                    IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ],
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                height: MediaQuery.of(context).size.height*0.43,
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(24),topLeft: Radius.circular(24)) ,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(menu.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Description",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),),
                    SizedBox(
                      height: 10,
                    ),
                    Text(menu.des,
                      style: TextStyle(
                        color: Colors.grey
                      ),),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            data.decrement(menu);
                          },
                          child: _buildUpDown(
                            Icons.remove,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(data.count.toString(),style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          onTap: () {
                            data.increment(menu);
                          },
                          child: _buildUpDown(
                            Icons.add,
                          ),
                          highlightColor: Colors.brown,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Price",style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("\$${menu.price}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22
                              ),)
                          ],
                        ),
                        RaisedButton(
                          color: kColorGreen,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          onPressed: () {  },
                          child: Text(data.total == 0 ? "Add To Card" : "\$${data.total.toString()}",style: TextStyle(
                              color: Colors.white
                          ),),
                        )
                      ],
                    ),


                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
  Widget _buildUpDown(IconData iconData){
    return    Container(
      width: 37,
      height: 37,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: kColorGreen,
            width: 1.0
        ),
      ),
      child: Icon(iconData,size: 20,),
    );
  }
}
