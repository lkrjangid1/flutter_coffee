import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/model/cart.dart';
import 'package:fluttercoffee/src/model/menu.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/categories/cart_empty.dart';
import 'package:fluttercoffee/src/provider/cart_provider.dart';
import 'package:fluttercoffee/src/shared/containercard.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:fluttercoffee/src/util/router_path.dart';
import 'package:provider/provider.dart';

class MyCartPage extends StatelessWidget {
  final List<Cart> listCart;
  MyCartPage(this.listCart);

  @override
  Widget build(BuildContext context) {

    var data = Provider.of<CartProvider>(context,listen: true);
    double sum = 0;
    for(int i = 0; i< listCart.length; i++){
      sum += double.parse(listCart[i].menu.price) * double.parse(listCart[i].quantity);
    }
    return Scaffold(
      body: listCart.length == 0 ? CartEmpty() : Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15,right: 15,top: 60,bottom: 120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios,size: 20,),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text("My Order",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),),
                Expanded(
                  child: ListView.builder(
                    itemCount: listCart.length,
                    shrinkWrap: true,
                    itemBuilder: (_,index){
                      int quantity = int.parse(listCart[index].quantity);
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Dismissible(
                          background: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Icon(Icons.delete,color: Colors.white,
                            size: 25,),
                          ),
                          onDismissed: (direction){
                              data.removeItem(index);
                          },
                          key: UniqueKey(),
                          child: ContainerCard(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CachedNetworkImage(
                                  width: 85,
                                  height: 85,
                                  imageUrl: listCart[index].menu.image,
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
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(listCart[index].menu.name,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18
                                      ),),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("\$${listCart[index].menu.price}"),

                                  ],
                                ),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.greenAccent.withOpacity(.2),
                                  ),
                                  child: Column(
                                    children: [
                                      _buildIncreDecre(Icons.add, () => data.increment(listCart[index].menu.menuId,quantity)),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(listCart[index].quantity.toString()),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      _buildIncreDecre(Icons.remove, () => null),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),

                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(left: 20,right: 20,bottom: 10,top: 20),
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
                  color: Colors.white,

                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total:",style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,

                        ),),
                        Text("\$${sum}",style: TextStyle(
                          color: Colors.black,
                          fontSize: 21,
                          fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: kColorGreen,
                      onPressed: (){
                        data.purchase(listCart,sum);

                        Navigator.pushReplacementNamed(context, CheckoutPagee);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart,color: Colors.white,),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Buy",style: TextStyle(
                            color: Colors.white,
                          ),)
                        ],
                      ),),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
Widget _buildIncreDecre(IconData iconData,VoidCallback onTap){
  return InkWell(
    onTap: onTap,
    child: Container(

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(iconData,size: 20,color: Colors.black,),
    ),
  );
}
