import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/model/menu.dart';
import 'package:fluttercoffee/src/model/cart.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/categories/my_bag_page.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/categories/my_cart_page.dart';
import 'package:fluttercoffee/src/provider/detail_provider.dart';
import 'package:fluttercoffee/src/provider/cart_provider.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:fluttercoffee/src/util/router_path.dart';
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
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(

        ),
        child: Stack(
          children: <Widget>[
            Hero(
              tag: widget.menu.name,
              child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*0.60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.menu.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 60),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        _buildToolBar(Icons.arrow_back_ios, () { Navigator.pop(context); }),
                        Spacer(),
                        _buildToolBar(Icons.shopping_cart, () {
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>MyCartPage(data.listCart)));
                        }),
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
                padding: EdgeInsets.only(left: 20,top: 30),
                height: MediaQuery.of(context).size.height*0.43,
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
                        fontSize: 28,
                      ),),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Description",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Text(widget.menu.des,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
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
                            fontSize: 18
                          ),),
                          GestureDetector(
                            onTap: (){
                              data.addItemm(widget.menu);
                            },
                            child: Text("Add to card",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,

                            ),),
                          )
                        ],
                      ),
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

  Widget _buildToolBar(IconData iconData,VoidCallback voidCallback){
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle
        ),
        child: Icon(
          iconData,
          size: 15,
        ),
      ),
    );
  }
}
