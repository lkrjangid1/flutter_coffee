import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttercoffee/src/model/menu.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/home/detail_home_page.dart';
import 'package:fluttercoffee/src/provider/categories_provider.dart';
import 'package:fluttercoffee/src/provider/home_provider.dart';
import 'package:fluttercoffee/src/provider/profile_provider.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:fluttercoffee/src/util/router_path.dart';
import 'package:provider/provider.dart';

//class HomePage extends StatelessWidget  {
//  final String uid;
//
//  const HomePage({key, this.uid}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
////    Provider.of<ProfileProvider>(context,listen: false).getUser(uid);
//    Provider.of<HomeProvider>(context,listen: false).getAllMenu();
//
//    return Scaffold(
//      body: RefreshIndicator (
//        onRefresh: () async {
//          var menuData =  Provider.of<HomeProvider>(context,listen: false);
//          await menuData.getAllMenu();
//        },
//        child: Container(
//          width: double.infinity,
//          decoration: BoxDecoration(
//            image: DecorationImage(
//              image: AssetImage(
//                'assets/home/caffee3.jpg',
//              ),
//              fit: BoxFit.cover,
//            ),
//          ),
//          child: Column(
//            children: <Widget>[
//              Container(
//                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
//                  width: double.infinity,
//                  height: MediaQuery.of(context).size.height * .27,
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      const SizedBox(
//                        height: 15,
//                      ),
//                      Consumer<ProfileProvider>(
//                        builder: (BuildContext context, ProfileProvider value, Widget child) {
//                          return value.isLoading ? Center(child: CircularProgressIndicator(),)
//                              : Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children: <Widget>[
//                              Text(value.user.userName == null ? "null" : "Hello,${value.user.userName}",
//                                style: TextStyle(
//                                    color: Colors.white,
//                                    fontWeight: FontWeight.bold,
//                                    fontSize: 27
//                                ),),
//                              Container(
//                                width: 40,
//                                height: 40,
//                                decoration: BoxDecoration(
//                                    image: DecorationImage(
//                                      image: NetworkImage(value.user.image),
//                                    ),
//                                    shape: BoxShape.circle
//                                ),
//                              )
//                            ],
//                          );
//                        },
//                      ),
//                      SizedBox(
//                        height: MediaQuery.of(context).size.height * 0.05,
//                      ),
//                      Align(
//                        alignment: Alignment.centerRight,
//                        child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          mainAxisAlignment: MainAxisAlignment.start,
//                          children: <Widget>[
//                            Text("Coffee".toUpperCase(),
//                              style: TextStyle(
//                                  color: Colors.white,
//                                  fontSize: 22,
//                                  fontWeight: FontWeight.bold
//                              ),
//                            ),
//                            Text("It's Great Day For Coffee",
//                              style: TextStyle(
//                                color: Colors.white,
//                                fontSize: 20,
//
//                              ),
//                            ),
//                          ],
//                        ),
//                      )
//                    ],
//                  )
//              ),
//              Expanded(
//                child: Container(
//                    width: double.infinity,
//                    padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
//                    decoration: BoxDecoration(
//                      color: Colors.white,
//                      borderRadius: BorderRadius.only(
//                        topLeft: Radius.circular(50),
//                        topRight: Radius.circular(50),
//                      ),
//                    ),
//                    child: Consumer<HomeProvider>(
//                      builder: (BuildContext context, HomeProvider value, Widget child) {
//                        return value.isLoading ? Center(
//                          child: CircularProgressIndicator(),
//                        ): ListView.builder(
//                          itemCount: value.listMenu.length,
//                          shrinkWrap: true,
//                          physics: ClampingScrollPhysics(),
//                          itemBuilder: (BuildContext context, int index) {
//                            Menu menu = value.listMenu[index];
//                            return Padding(
//                              padding: const EdgeInsets.only(bottom: 20),
//                              child: GestureDetector(
//                                onTap: (){
//
//                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailHomePage(image: value.listImageURL[index],menu: menu,)));
//                                },
//                                child: Row(
//                                  mainAxisAlignment: MainAxisAlignment.start,
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//                                    ClipRRect(
//                                      child: CachedNetworkImage(
//                                        width: 120,
//                                        height: 120,
//                                        imageUrl: value.listImageURL[index],
//                                        fit: BoxFit.cover,
//                                        progressIndicatorBuilder:
//                                            (context, url,
//                                            downloadProgress) =>
//                                            CircularProgressIndicator(
//                                                value:
//                                                downloadProgress
//                                                    .progress),
//                                        errorWidget:
//                                            (context, url, error) =>
//                                            Icon(Icons.error),
//                                      ),
//                                      borderRadius: BorderRadius.circular(20),
//                                    ),
//                                    const SizedBox(
//                                      width: 20,
//                                    ),
//                                    Column(
//                                      mainAxisAlignment: MainAxisAlignment.start,
//                                      crossAxisAlignment: CrossAxisAlignment.start,
//                                      children: <Widget>[
//                                        const SizedBox(
//                                          height: 10,
//                                        ),
//                                        Text(menu.name,
//                                          style: TextStyle(
//                                              color: Colors.black,
//                                              fontWeight: FontWeight.bold,
//                                              fontSize: 18
//                                          ),),
//                                        const SizedBox(
//                                          height: 5,
//                                        ),
//                                        Text(menu.des,
//                                          style: TextStyle(
//                                            color: Colors.grey,
//
//                                          ),),
//                                        const SizedBox(
//                                          height: 20,
//                                        ),
//                                        Text("\$${menu.price}".toString(),
//                                          style: TextStyle(
//                                              color: kColorGreen,
//                                              fontWeight: FontWeight.bold,
//                                              fontSize: 17
//                                          ),),
//                                      ],
//                                    )
//                                  ],
//                                ),
//                              ),
//                            );
//                          },
//
//                        );
//                      },
//                    )
//                ),
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}

class HomeProvider1 extends StatelessWidget {
  final String uid;

  const HomeProvider1({Key key, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>ProfileProvider(),
    child: HomePage(uid: uid,),);
  }
}


class HomePage extends StatelessWidget {
  final String uid;

  const HomePage({key, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ProfileProvider>(context).getUser(uid);
    Provider.of<HomeProvider>(context).getImageSlide();

    custom() {
      return Consumer<ProfileProvider>(
        builder: (BuildContext context, ProfileProvider value, Widget child) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                leading: Icon(null),
                expandedHeight: 150.0,
                floating: false,
                backgroundColor: Colors.white,
                pinned: true,
                flexibleSpace: Stack(
                  children: <Widget>[
                    Positioned(
                        child: Stack(children: <Widget>[
                          Container(
                              height: 230,
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      "assets/home/caffee3.jpg",
                                    ),
                                    fit: BoxFit.cover
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        value.user.userName == null
                                            ? "null"
                                            : "Hello,${value.user.userName}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 27),
                                      ),
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image:
                                              NetworkImage(value.user.image),
                                            ),
                                            shape: BoxShape.circle),
                                      )
                                    ],
                                  ),
                                ],
                              )
                          ),
                        ],)
                    ),
                  ],
                ),
              ),
              SliverList(delegate: SliverChildListDelegate(
                [
//                  CarouselSlider(
//                    options: CarouselOptions(height: 400),
//                    items: <Widget>[],
//                    CarouselOptions(height: 400.0),
//                    items: [1,2,3,4,5].map((i) {
//                      return Builder(
//                        builder: (BuildContext context) {
//                          return Container(
//                              width: MediaQuery.of(context).size.width,
//                              margin: EdgeInsets.symmetric(horizontal: 5.0),
//                              decoration: BoxDecoration(
//                                  color: Colors.amber
//                              ),
//                              child: Text('text $i', style: TextStyle(fontSize: 16.0),)
//                          );
//                        },
//                      );
//                    }).toList(),
//                  )
                ]
              ),
               
              ),

            ],
          );
        },);
    }
    return Container(
      child: custom(),
    );
  }
}