import 'package:flutter/material.dart';
import 'package:e_shop/pages/Main/index.dart';
import 'package:e_shop/pages/Login/index.dart';

Widget getRootWidget(){
  return MaterialApp(
    routes: getRootRoutes(),
  );
}

Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {
    "/": (context) => MainPage(),
    "/login": (context) => LoginPage(),
  };
}