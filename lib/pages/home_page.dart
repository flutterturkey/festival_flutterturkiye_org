import 'package:flutter/material.dart';
import 'package:hackathon_flutterturkiye_org/widgets/section_title.dart';
import 'package:hackathon_flutterturkiye_org/widgets/speaker_card.dart';
import 'package:hackathon_flutterturkiye_org/widgets/speakers_section.dart';

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
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                sectionTitle('Konuşmacılar'),
                speakersSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
