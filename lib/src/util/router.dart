
import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/page/auth/register_page.dart';
import 'package:fluttercoffee/src/page/dashboard/dashboard_page.dart';
import 'package:fluttercoffee/src/page/auth/login_page.dart';
import 'package:fluttercoffee/src/page/onboard_page.dart';
import 'package:fluttercoffee/src/page/optionauth_page.dart';

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
      }
  }
}