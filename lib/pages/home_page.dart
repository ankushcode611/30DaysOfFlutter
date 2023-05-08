// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_lifecycle_statefulwidget/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catalog.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Ankush";

  final url =
      "https://api.myjson.online/v1/records/2a319c53-0bc7-441a-bd9e-7d471203266f";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  // loadData() async {
  //   await Future.delayed(Duration(seconds: 2));
  //   // final catalogJson =
  //   // await rootBundle.loadString('assets/files/catalog.json');
  //   final response = await http.get(Uri.parse(url));
  //   final catalogJson = response.body;

  //   final decodeData = jsonDecode(catalogJson);
  //   var productsData = decodeData["products"];
  //   CatalogModel.items = List.from(productsData)
  //       .map<Item>((item) => Item.fromMap(item))
  //       .toList();
  //   setState(() {});
  // }

loadData() async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request(
      'GET',
      Uri.parse(
          'https://api.myjson.online/v1/records/2a319c53-0bc7-441a-bd9e-7d471203266f'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var catalogJson = await response.stream.bytesToString();
    var decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["data"]["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  } else {
    print(response.reasonPhrase);
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: context.theme.buttonColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().py24().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
