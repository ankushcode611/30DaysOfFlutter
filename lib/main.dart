// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_lifecycle_statefulwidget/pages/cart_page.dart';
import 'package:test_lifecycle_statefulwidget/pages/home_detail_page.dart';
import 'package:test_lifecycle_statefulwidget/pages/home_page.dart';
import 'package:test_lifecycle_statefulwidget/pages/loginpage.dart';
import 'package:test_lifecycle_statefulwidget/utils/routes.dart';
import 'package:test_lifecycle_statefulwidget/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_strategy/url_strategy.dart';
import 'core/store.dart';
import 'models/catalog.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(store: MyStore(), child: MyApp()));
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(routes: {
        "/": (_, __) => MaterialPage(child: LoginPage()),
        MyRoutes.homeRoute: (_, __) => MaterialPage(child: HomePage()),
        MyRoutes.homeDetailsRoute: (uri, _){
          final catalog = (VxState.store as MyStore).catalog.getById(int.parse(uri.queryParameters["id"]!));
          return MaterialPage(child: HomeDetailPage(
            catalog: catalog,
          ));
        },
           
        MyRoutes.loginRoute: (_, __) => MaterialPage(child: LoginPage()),
        MyRoutes.cartRoute: (_, __) => MaterialPage(child: CartPage())
      }),
      // initialRoute: MyRoutes.homeRoute,
      // routes: {
      //   "/": (context) => LoginPage(),
      //   MyRoutes.homeRoute: (context) => HomePage(),
      //   MyRoutes.loginRoute: (context) => LoginPage(),
      //   MyRoutes.cartRoute: (context) => CartPage(),
    );
  }
}
