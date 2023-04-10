import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_lifecycle_statefulwidget/pages/home_page.dart';
import 'package:test_lifecycle_statefulwidget/pages/loginpage.dart';
import 'package:test_lifecycle_statefulwidget/utils/routes.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: GoogleFonts.lato().fontFamily,
          primaryTextTheme: GoogleFonts.latoTextTheme()),
          debugShowCheckedModeBanner: false,
      darkTheme:
          ThemeData(brightness: Brightness.dark, primarySwatch: Colors.purple),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage()
      },
    );
  }
}
