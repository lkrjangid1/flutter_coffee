import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttercoffee/src/model/menu.dart';
import 'package:fluttercoffee/src/model/news.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/home/detail_home_page.dart';
import 'package:fluttercoffee/src/provider/categories_provider.dart';
import 'package:fluttercoffee/src/provider/home_provider.dart';
import 'package:fluttercoffee/src/provider/profile_provider.dart';
import 'package:fluttercoffee/src/shared/containercard.dart';
import 'package:fluttercoffee/src/util/const.dart';
import 'package:fluttercoffee/src/util/router_path.dart';
import 'package:fluttercoffee/src/util/shimmer.dart';
import 'package:provider/provider.dart';
class HomeProvider1 extends StatelessWidget {
  final String uid;
  const HomeProvider1({Key key, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProfileProvider(),
      child: HomePage(
        uid: uid,
      ),
    );
  }
}
class HomePage extends StatelessWidget {
  final String uid;

  const HomePage({key, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ProfileProvider>(context,listen: false).getUser(uid);
    Provider.of<HomeProvider>(context,listen: false).getImageSlide(); // warning
    Provider.of<HomeProvider>(context,listen: false).getNews1();
    Provider.of<HomeProvider>(context,listen: false).getNews2();
    Provider.of<HomeProvider>(context,listen: false).getNews3();

    custom() {
      return Consumer2<ProfileProvider,HomeProvider>(
        builder: (BuildContext context, ProfileProvider profProvider,
            HomeProvider homeProvider,
            Widget child) {
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
                              child: profProvider.isLoading ? CircularProgressIndicator() : Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    profProvider.user.userName == null
                                        ? "null"
                                        : "Hello,${profProvider.user.userName}",
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
                                          NetworkImage(profProvider.user.image),
                                        ),
                                        shape: BoxShape.circle),
                                  )
                                ],
                              )
                          ),
                        ],)
                    ),
                  ],
                ),
              ),
              SliverList(delegate: SliverChildListDelegate([
                const SizedBox(
                  height: 5,
                ),
                homeProvider.isLoading
                    ? ShimmerList()
                    : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                              CarouselSlider(
                                items: homeProvider.listImageSlideURL.map((e) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        width: double.infinity,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(e),
                                              fit: BoxFit.cover),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                                options: CarouselOptions(
                                  height: 200,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 1000),
                                  autoPlayCurve: Curves.ease,
                                ),
                              ),
                              SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ContainerCard(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                               _buildTitleNews("Hey! What do you want to drink?"),
                                const SizedBox(
                                  height: 10,
                                ),

                                SizedBox(
                                  height:110 ,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: homeProvider.listNews1.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      News neww = homeProvider.listNews1[index];
                                      return  Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                        child: Container(
                                          width: 200,
                                          height: 120,
                                          child: Stack(
                                            children: <Widget>[
                                              CachedNetworkImage(
                                                width: 200,
                                                imageUrl: homeProvider.listImageNewsURL[index],
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
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.black.withOpacity(.3),
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    neww.title,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                  Text(
                                                    neww.des,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ContainerCard(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                              _buildTitleNews('Hot Deal'),
                                SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  height: 260,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: homeProvider.listNews2.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (BuildContext context, int index) {
                                      News newss = homeProvider.listNews2[index];
                                      return  Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                        child: Material(
                                          elevation: 2.0,
                                          child: Container(
                                            width: 200,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                CachedNetworkImage(
                                                  width: double.infinity,
                                                  height: 130,
                                                  imageUrl: homeProvider.listImageNewsURL2[index],
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
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(newss.title,style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold
                                                  ),),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(newss.des,style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14
                                                  ),),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 180,
                            child: Image.asset('assets/voucher.jpg',fit: BoxFit.cover,),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ContainerCard(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                _buildTitleNews("News"),

                               ListView.builder(
                                 shrinkWrap: true,
                                 physics: ClampingScrollPhysics(),
                                 itemCount: homeProvider.listNews3.length,
                                 itemBuilder: (BuildContext context, int index) {
                                   return  Padding(
                                     padding: const EdgeInsets.only(bottom: 10),
                                     child: Material(
                                       color: Colors.white,
                                       elevation: 2.0,
                                       child: Container(
                                         width: double.infinity,

                                         decoration: BoxDecoration(

                                         ),
                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.start,
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: <Widget>[
                                             CachedNetworkImage(
                                               width: 100,
                                               height: 130,
                                               imageUrl: homeProvider.listImageNewsURL3[index],
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
                                             Expanded(
                                               child: Padding(
                                                 padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                                                 child: Column(
                                                   crossAxisAlignment: CrossAxisAlignment.start,
                                                   mainAxisAlignment: MainAxisAlignment.start,
                                                   children: <Widget>[
                                                     Text(homeProvider.listNews3[index].title,
                                                     style: TextStyle(
                                                       color: Colors.black,
                                                       fontWeight: FontWeight.bold
                                                     ),),
                                                     const SizedBox(
                                                       height: 5,
                                                     ),
                                                     Text(homeProvider.listNews3[index].des,
                                                       maxLines: 2,
                                                       style: TextStyle(
                                                           color: Colors.grey,
                                                       ),),
                                                   ],
                                                 ),
                                               ),
                                             )
                                           ],
                                         ),
                                       ),
                                     ),
                                   );
                                 },
                               )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
                  ],
                ),
              ),
            ],
          );
        },
      );
    }

    return Container(

      child: custom(),
    );
  }

  Widget _buildTitleNews(String title){
    return   Text(
      title,
      style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18),
    );
  }

}
