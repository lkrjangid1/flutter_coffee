
import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/model/menu.dart';
import 'package:fluttercoffee/src/page/auth/register_page.dart';
import 'package:fluttercoffee/src/page/dashboard/dashboard_page.dart';
import 'package:fluttercoffee/src/page/auth/login_page.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/categories/detail_categories_food_page.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/categories/detail_categories_page.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/home/detail_home_page.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/profile/information_account_page.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/store/detail_store_page.dart';
import 'package:fluttercoffee/src/page/onboard_page.dart';
import 'package:fluttercoffee/src/page/auth/optionauth_page.dart';

import 'package:fluttercoffee/src/page/splash/splashscreen_page.dart';
import 'package:fluttercoffee/src/util/router_path.dart';

class Router{
  static Route<dynamic> onGenerateRouter(RouteSettings settings){
      switch(settings.name){
        case SplashPage:
          return MaterialPageRoute(builder: (_)=>SplashScreenPage());
        case LoginPage:
          return MaterialPageRoute(builder: (_)=>LoginScreenPage());
        case RegisterPage:
          return MaterialPageRoute(builder: (_)=>RegisterScreenPage());
        case DashBoardPage:
          final argurment = settings.arguments;
          return MaterialPageRoute(builder: (BuildContext context)  => DashboardScreenPage(uid: argurment,));
        case OnBoardPage:
          return MaterialPageRoute(builder: (_)=>OnboardPage());
        case OptionAuthPagee:
          return MaterialPageRoute(builder: (_)=>OptionAuthPage());
        case DetailStorePagee:
          final argument = settings.arguments;
          return MaterialPageRoute(builder: (_)=>DetailStorePage(store: argument,));
        case DetailCategoriesPagee:
          final argument = settings.arguments;
          return MaterialPageRoute(builder: (_)=>DetailCategoriesPage(idCategories: argument,));
        case DetailCategoriesFoodPagee:
          final argument = settings.arguments;
          return MaterialPageRoute(builder: (_)=>DetailCategoriesFoodPageee(menu: argument,));
//        case InformationAccountPagee:
//          return MaterialPageRoute(builder: (_)=>InformationAccountPage(email: argument,image: image,));
//        case DetailHomePagee:
//          var menu  = settings.name;
//          var image = settings.arguments;
//          return MaterialPageRoute(builder: (_)=>DetailHomePage(image: image,menu: menu,));
      }
  }
}