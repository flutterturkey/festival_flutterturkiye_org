import 'package:flutter/material.dart';
import 'package:hackathon_flutterturkiye_org/core/ui/section_title.dart';
import 'package:hackathon_flutterturkiye_org/footer/ui/footer_view.dart';
import 'package:hackathon_flutterturkiye_org/speaker/ui/speakers_section.dart';

class FlutterFestivalHomePage extends StatefulWidget {
  FlutterFestivalHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FlutterFestivalHomePageState createState() =>
      _FlutterFestivalHomePageState();
}

class _FlutterFestivalHomePageState extends State<FlutterFestivalHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SectionTitle(title: 'Konuşmacılar'),
                SpeakersSection(),
                FooterView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
