import 'package:flutter/material.dart';

import '../utils/routes.dart';

// ignore: use_key_in_widget_constructors
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_image.png",
              fit: BoxFit.cover,
              height: 250,
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome $name",
              // ignore: prefer_const_constructors
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 20.0,
            ),
            Padding(
              // ignore: prefer_const_constructors
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                        hintText: "Enter Username", labelText: "Username"),
                  ),
                  TextFormField(
                      obscureText: true,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      }),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 20.0,
                  ),

                  InkWell(
                    onTap: () async {
                      setState(() {
                        changeButton = true;
                      });

                      await Future.delayed(Duration(seconds: 1));
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changeButton ? 50 : 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: changeButton
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text(
                              "login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius:
                              BorderRadius.circular(changeButton ? 50 : 8)),
                    ),
                  ),

                  // ElevatedButton(
                  //   // ignore: prefer_const_constructors
                  //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  //   // ignore: prefer_const_constructors
                  //   child: Text("login"),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
