
import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/model/menu.dart';
import 'package:fluttercoffee/src/page/auth/changepass_page.dart';
import 'package:fluttercoffee/src/page/auth/forgotpass_page.dart';
import 'package:fluttercoffee/src/page/auth/otp_page.dart';
import 'package:fluttercoffee/src/page/auth/register_page.dart';
import 'package:fluttercoffee/src/page/auth/success_page.dart';
import 'package:fluttercoffee/src/page/auth/verifyphone_page.dart';
import 'package:fluttercoffee/src/page/dashboard/dashboard_page.dart';
import 'package:fluttercoffee/src/page/auth/login_page.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/categories/checkout_page.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/categories/detail_categories_food_page.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/categories/detail_categories_page.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/categories/my_cart_page.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/home/detail_home_page.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/profile/history/detail_history_page.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/profile/history/history_page.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/profile/information_account_page.dart';
import 'package:fluttercoffee/src/page/dashboard/tab/store/detail_store_page.dart';
import 'package:fluttercoffee/src/page/onboard_page.dart';
import 'package:fluttercoffee/src/page/auth/optionauth_page.dart';

import 'package:fluttercoffee/src/page/splash/splashscreen_page.dart';
import 'package:fluttercoffee/src/util/router_path.dart';
import 'package:page_transition/page_transition.dart';

class Routerr{
  static Route<dynamic> onGenerateRouter(RouteSettings settings){
      switch(settings.name){
        case SplashPage:
          return  PageTransition(child: SplashScreenPage(), type: PageTransitionType.fade);
        case LoginPage:
          return  PageTransition(child: LoginScreenPage(), type: PageTransitionType.fade);
          case RegisterPage:
          return  PageTransition(child: RegisterScreenPage(), type: PageTransitionType.fade);
          case DashBoardPage:
            final argurment = settings.arguments;
            return  PageTransition(child: DashboardScreenPage(uid: argurment,), type: PageTransitionType.fade,);
        case OnBoardPage:
          return  PageTransition(child: OnboardPage(), type: PageTransitionType.fade);
        case OptionAuthPagee:
          return  PageTransition(child: OptionAuthPage(), type: PageTransitionType.fade);
        case ForgotPassPagee:
          return  PageTransition(child: ForgoPassPage(), type: PageTransitionType.fade);
        case VerifyPhonePagee:
          return  PageTransition(child: VerifyPhonePage(), type: PageTransitionType.fade);
        case ChangePassPagee:
          return  PageTransition(child: ChangePassPage(), type: PageTransitionType.fade);
        case OTPPagee:
          final argument = settings.arguments;

          return  PageTransition(child: OtpPage(phoneNumber: argument,), type: PageTransitionType.fade);
        case SucessPagee:
          return  PageTransition(child: SuccessPage(), type: PageTransitionType.fade);
        case DetailStorePagee:
          final argument = settings.arguments;

          return  PageTransition(child: DetailStorePage(store: argument,), type: PageTransitionType.fade);

        case DetailCategoriesPagee:
          final argument = settings.arguments;
          return  PageTransition(child: DetailCategoriesPage(idCategories: argument,), type: PageTransitionType.fade,);

        case DetailCategoriesFoodPagee:
          final argument = settings.arguments;
          return  PageTransition(child: DetailCategoriesFoodPage(menu: argument,), type: PageTransitionType.fade);


          return MaterialPageRoute(builder: (_)=>DetailCategoriesFoodPageee(menu: argument,));
        case HistoryPageeee:
          return  PageTransition(child: HistoryPage(), type: PageTransitionType.fade);

        case DetailHistoryPagee:
          final argument = settings.arguments;
          return  PageTransition(child: DetailHistoryPage(), type: PageTransitionType.fade);
//        case MyCartPagee:
//          final argument = settings.arguments;
//          return  PageTransition(child: MyCartPage(listCartMenu: argument,), type: PageTransitionType.fade);
        case CheckoutPagee:
          return  PageTransition(child: CheckoutPage(), type: PageTransitionType.fade);
//        case InformationAccountPagee:
//          return MaterialPageRoute(builder: (_)=>InformationAccountPage(email: argument,image: image,));
//        case DetailHomePagee:
//          var menu  = settings.name;
//          var image = settings.arguments;
//          return MaterialPageRoute(builder: (_)=>DetailHomePage(image: image,menu: menu,));
      }
  }
}