import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/model/menu.dart';
import 'package:fluttercoffee/src/model/order.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/categories/my_bag_page.dart';
import 'package:fluttercoffee/src/provider/detail_provider.dart';
import 'package:fluttercoffee/src/provider/order_provider.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:provider/provider.dart';

class DetailCategoriesFoodPageee extends StatelessWidget {
  final Menu menu;
  final String image;
  const DetailCategoriesFoodPageee({Key key, this.menu, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailProvider>(
      create: (BuildContext context) => DetailProvider(),
      child: DetailCategoriesFoodPage(menu: menu,image: image),

    );
  }
}


class DetailCategoriesFoodPage extends StatelessWidget {
  final Menu menu;
  final String image;

  const DetailCategoriesFoodPage({Key key, this.menu, this.image}) : super(key: key);
  Widget build(BuildContext context) {
    var data = Provider.of<OrderProvider>(context,listen: true);
    bool isShowing = false;

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
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
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
                    Expanded(
                      child: Text(menu.des,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Consumer<DetailProvider>(
                      builder: (BuildContext context, DetailProvider detailPro,
                          Widget child) {
                        return Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Visibility(
                                  child: InkWell(
                                    onTap: () {
                                      detailPro.decrement(menu);
                                    },
                                    child: _buildUpDown(
                                      Icons.remove,
                                    ),
                                  ),
                                  visible: detailPro.isShowing,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    detailPro.count.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    detailPro.increment(menu);
                                  },
                                  child: _buildUpDown(
                                    Icons.add,
                                  ),
                                  highlightColor: Colors.brown,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Price",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "\$${menu.price}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    )
                                  ],
                                ),
                                RaisedButton(
                                  color: kColorGreen,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  onPressed: () {
                                    data.addItem(Order(menu: menu, amount: detailPro.count),);
                                    data.showing(true);
                                  },
                                  child: Text(
                                    detailPro.total == 0
                                        ? "Add To Card"
                                        : "\$${detailPro.total.toString()}",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                          ],
                        );
                      },
                    ),

                 Visibility(
                   visible: data.isShowing,
                   child:    InkWell(
                     onTap: (){
                       _showBottomSheett(context,data);
                     },
                     child: Container(
                       padding: const EdgeInsets.symmetric(horizontal: 10),
                       width: double.infinity,
                       height: 40,
                       decoration: BoxDecoration(
                         color: kColorGreen,
                         borderRadius: BorderRadius.circular(10),
                       ),
                       child: Row(
                         children: <Widget>[
                           Icon(Icons.shopping_cart,color: Colors.white,),
                           const SizedBox(
                             width: 10,
                           ),
                           Expanded(
                             child: Text("${data.listOrder.length} Item",style: TextStyle(
                               color: Colors.white,
                               fontWeight: FontWeight.bold,
                             ),),
                           ),
                           Text("\$ 100.00",style: TextStyle(
                               color: Colors.white,
                               fontWeight: FontWeight.bold
                           ),)
                         ],
                       ),
                     ),
                   ),
                 )
                  ],

                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
  Widget _buildUpDown(IconData iconData) {
    return Container(
      width: 37,
      height: 37,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: kColorGreen, width: 1.0),
      ),
      child: Icon(
        iconData,
        size: 20,
      ),
    );
  }

  _showBottomSheett(BuildContext context,OrderProvider orderProvider){
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (_){
      return MyBagPage(listOrder: orderProvider.listOrder,);
    });
  }
}
