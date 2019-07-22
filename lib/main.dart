import 'package:movies/src/pages/home_page.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      initialRoute: '/',
      routes: {
        '/' : (BuildContext context) => HomePage()
      }
    );
  }
}