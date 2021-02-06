import 'package:flutter/material.dart';

import '../core/components/app_bar/app_bar_action_button.dart';
import '../core/components/app_bar/app_bar_title.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppBarTitle(),
        actions: [
          AppBarActionButton(onPressed: () {}, title: 'Konuşmacılar'),
          AppBarActionButton(onPressed: () {}, title: 'Etkinlik Programı'),
          AppBarActionButton(onPressed: () {}, title: 'Sponsorlar'),
          AppBarActionButton(onPressed: () {}, title: 'SSS'),
          AppBarActionButton(onPressed: () {}, title: 'İletişim'),
          AppBarActionButton(onPressed: () {}, title: 'Kayıt Ol', isFilledButton: true),
        ],
      ),
      body: Container(),
      backgroundColor: Colors.red,
    );
  }
}
