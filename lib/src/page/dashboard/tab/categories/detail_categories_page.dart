import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/model/menu.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/categories/detail_categories_food_page.dart';
import 'package:fluttercoffee/src/provider/categories_provider.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:fluttercoffee/src/util/router_path.dart';
import 'package:fluttercoffee/src/util/shimmer.dart';
import 'package:provider/provider.dart';

class DetailCategoriesPage extends StatelessWidget {
  final String idCategories;
  const DetailCategoriesPage({Key key, this.idCategories}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    Provider.of<CategoriesProvider>(context,listen: false).getMenuByCategories(idCategories);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,), onPressed: ()=> Navigator.pop(context)),
        title: Text(idCategories,
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
                return value.isLoading ? CircularProgressIndicator(): Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailCategoriesFoodPageee(menu: menu)));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ClipRRect(
                          child: CachedNetworkImage(
                            width: 100,
                            height: 100,
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
                          borderRadius: BorderRadius.circular(20),
                        ),

                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(menu.name,
                                style: TextStyle(
                                    fontSize: 22,
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
              },);
          },)
      ),
    );
  }
}
