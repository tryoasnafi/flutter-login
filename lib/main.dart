import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';

void main() => runApp(MyApp());

final routes = {
  '/login': (BuildContext context) => LoginPage(),
  '/home': (BuildContext context) => HomePage(),
  '/register': (BuildContext context) => RegisterPage(),
  '/': (BuildContext context) => LoginPage(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Poppins',
        primarySwatch: Colors.blueGrey,
      ),
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
