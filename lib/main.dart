import 'package:festival_flutterturkiye_org/core/utils/get_it_initializer.dart';
import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:festival_flutterturkiye_org/pages/home_page.dart';
import 'package:flutter/material.dart';
// ignore: always_use_package_imports
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';

void main() {
  configureApp();
  initializeGetIt();
  runApp(const FlutterFestivalApp());
}

class FlutterFestivalApp extends StatelessWidget {
  const FlutterFestivalApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Festivali',
        theme: ThemeHelper.themeData,
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      );
}
