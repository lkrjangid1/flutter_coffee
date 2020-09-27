import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/model/menu.dart';
import 'package:fluttercoffee/src/model/cart.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/categories/my_bag_page.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/categories/my_cart_page.dart';
import 'package:fluttercoffee/src/provider/detail_provider.dart';
import 'package:fluttercoffee/src/provider/cart_provider.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:fluttercoffee/src/util/router_path.dart';
import 'package:fluttercoffee/src/util/showsnackbars.dart';
import 'package:fluttercoffee/src/util/sizeconfig.dart';
import 'package:provider/provider.dart';

class DetailCategoriesFoodPageee extends StatelessWidget {
  final Menu menu;
  const DetailCategoriesFoodPageee({Key key, this.menu, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailProvider>(
      create: (BuildContext context) => DetailProvider(),
      child: DetailCategoriesFoodPage(menu: menu),

    );
  }
}


class DetailCategoriesFoodPage extends StatefulWidget {
  final Menu menu;
  const DetailCategoriesFoodPage({Key key, this.menu}) : super(key: key);

  @override
  _DetailCategoriesFoodPageState createState() => _DetailCategoriesFoodPageState();
}

class _DetailCategoriesFoodPageState extends State<DetailCategoriesFoodPage> {

  Widget build(BuildContext context) {

    var data = Provider.of<CartProvider>(context,listen: true);
//    data.getCart();

    return Scaffold(
      body: Builder(builder: (ctx)=>Container(
        width: double.infinity,
        decoration: BoxDecoration(

        ),
        child: Stack(
          children: <Widget>[
            Hero(
              tag: widget.menu.name,
              child: Container(
                  width: double.infinity,
                  height: getScreenHeight(550),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.menu.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(left: getScreenWith(20),right: getScreenWith(20),top: getScreenHeight(40)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        _buildToolBar(Icons.arrow_back_ios, () { Navigator.pop(context); }),
                        Spacer(),

                        GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>MyCartPage(data.listCart)));

                            }
                            ,child: _buidlIconCard(data.listCart.length)),
                        SizedBox(
                          width: 10,
                        ),
                        _buildToolBar(Icons.favorite_border, () { }),
                      ],
                    ),
                  )),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: getScreenWith(20),top: getScreenHeight(30)),
                height: getScreenHeight(280),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(24),topLeft: Radius.circular(24)) ,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.menu.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: getScreenWith(20),
                      ),),
                    SizedBox(
                      height: getScreenHeight(15),
                    ),
                    Text("Description",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: getScreenWith(13),
                      ),),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Text(widget.menu.des,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                     SizedBox(
                      height: getScreenHeight(25),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: getScreenWith(20),vertical: getScreenHeight(25)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
                        color: kColorGreen.withOpacity(.7),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(10, 10),
                              blurRadius: 10,
                              color: Colors.greenAccent.withOpacity(.6)
                          ),
                          BoxShadow(
                              offset: Offset(-3, 0),
                              blurRadius: 15,
                              color: Colors.greenAccent.withOpacity(.9)
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\$${widget.menu.price}",style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.bold,
                              fontSize: getScreenWith(15)
                          ),),
                            InkWell(
                              onTap: () {
                                data.addItemm(widget.menu).then((value) => {
                                      if (value == true)
                                        {
                                          SnackBars.buildMessage(ctx,
                                              "Sản phẩm này đã có trong giỏ hàng")
                                        }
                                    });
                                data.saveCart();
                              },
                              child: Text(
                                "Add to card",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: getScreenWith(16),
                                ),
                              ),
                            ),
                          ],
                      ),
                    ),
                  ],

                ),
              ),
            ),

          ],
        ),
      ),),
    );
  }

Widget _buidlIconCard(int count){
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle
            ),
            child: Icon(
              Icons.shopping_cart,
              size: 20,
            ),
          ),
        ),
          count == 0 ? Container() :  Padding(
          padding: EdgeInsets.only(left: getScreenWith(20)),
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Text(count.toString(),style: TextStyle(
              fontSize: 11,
              color: Colors.white,
            ),),
          ),
        ),

      ],
    );
}

  Widget _buildToolBar(IconData iconData,VoidCallback voidCallback){
    return GestureDetector(
      onTap: voidCallback,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle
          ),
          child: Icon(
            iconData,
            size: 20,
          ),
        ),
      ),
    );
  }
}
