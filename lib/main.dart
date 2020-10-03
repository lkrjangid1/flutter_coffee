import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/page/demotab.dart';
import 'package:fluttercoffee/src/page/splash/splashscreen_page.dart';
import 'package:fluttercoffee/src/provider/auth_provider.dart';
import 'package:fluttercoffee/src/provider/categories_provider.dart';
import 'package:fluttercoffee/src/provider/detail_provider.dart';
import 'package:fluttercoffee/src/provider/detail_store_provider.dart';
import 'package:fluttercoffee/src/provider/home_provider.dart';
import 'package:fluttercoffee/src/provider/cart_provider.dart';
import 'package:fluttercoffee/src/provider/profile_provider.dart';
import 'package:fluttercoffee/src/util/router.dart';
import 'package:fluttercoffee/src/util/router_path.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => CategoriesProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) =>CartProvider(),
        )
      ],
      child: MyApp(),
    )

  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routerr.onGenerateRouter,
      initialRoute: SplashPage,
    );
  }
}

