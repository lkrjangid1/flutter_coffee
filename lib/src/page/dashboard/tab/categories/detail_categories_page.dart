import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/model/menu.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/categories/detail_categories_food_page.dart';
import 'package:fluttercoffee/src/provider/categories_provider.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:fluttercoffee/src/util/router_path.dart';
import 'package:fluttercoffee/src/util/shimmer.dart';
import 'package:fluttercoffee/src/util/sizeconfig.dart';
import 'package:provider/provider.dart';

class DetailCategoriesPage extends StatefulWidget {
  final String idCategories;
  const DetailCategoriesPage({Key key, this.idCategories}) : super(key: key);

  @override
  _DetailCategoriesPageState createState() => _DetailCategoriesPageState();
}

class _DetailCategoriesPageState extends State<DetailCategoriesPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CategoriesProvider>(context,listen: false).getMenuByCategories(widget.idCategories);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,)
            , onPressed: ()=> Navigator.pop(context)),
        title: Text(widget.idCategories,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        color: Colors.white,
        child: Consumer<CategoriesProvider>(
          builder: (BuildContext context, CategoriesProvider value, Widget child) {
            return value.isLoading ? ShimmerList() : ListView.builder(
              itemCount: value.listDetail.length,
              itemBuilder: (BuildContext context, int index) {
                Menu menu = value.listDetail[index];
                return  ItemList(menu: menu,);
              },);
          },)
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final Menu menu;

  const ItemList({Key key, this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: getScreenHeight(10)),
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, DetailCategoriesFoodPagee,arguments: menu);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: menu.name,
              child: ClipRRect(
                child: CachedNetworkImage(
                  width: getScreenWith(80),
                  height: getScreenHeight(80),
                  imageUrl: menu.image,
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
                borderRadius: BorderRadius.circular(15),
              ),
            ),

             SizedBox(
              width: getScreenWith(15),
            ),
            Expanded(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(menu.name,
                    style: TextStyle(
                        fontSize: getScreenWith(15),
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(menu.des,style: TextStyle(
                      color: Colors.grey
                  ),),
                ],
              ),
            ),
            Text("\$${menu.price}",
              style: TextStyle(
                  color: kColorGreen,
                  fontWeight: FontWeight.bold
              ),),
          ],
        ),
      ),
    );
  }
}
