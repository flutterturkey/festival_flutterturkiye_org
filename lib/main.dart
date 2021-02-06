import 'package:flutter/material.dart';
import 'package:hackathon_flutterturkiye_org/core/styles/theme_helper.dart';
import 'package:hackathon_flutterturkiye_org/flutter_festival_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Festival',
      theme: ThemeHelper.themeData,
      home: FlutterFestivalHomePage(title: 'Flutter Festival'),
      debugShowCheckedModeBanner: false,
    );
  }
}
