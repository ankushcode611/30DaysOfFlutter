import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_lifecycle_statefulwidget/pages/home_page.dart';
import 'package:test_lifecycle_statefulwidget/pages/loginpage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: GoogleFonts.lato().fontFamily,
          primaryTextTheme: GoogleFonts.latoTextTheme()),
      darkTheme:
          ThemeData(brightness: Brightness.dark, primarySwatch: Colors.purple),
      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage()
      },
    );
  }
}
