import 'package:flutter/material.dart';
import 'package:hackathon_flutterturkiye_org/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Festival',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Manrope',
      ),
      home: HomePage(title: 'Flutter Festival'),
    );
  }
}
