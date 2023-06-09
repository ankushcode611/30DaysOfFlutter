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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      onGenerateRoute: (settings) {
        if (settings.name == MyRoutes.homeDetailsRoute) {
          final uri = Uri.parse(settings.name!);
          final catalog = (VxState.store as MyStore)
              .catalog
              .getById(int.parse(uri.queryParameters["id"]!));
          return MaterialPageRoute(
            builder: (_) => HomeDetailPage(catalog: catalog),
            settings: settings,
          );
        }
        return null;
      },
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
