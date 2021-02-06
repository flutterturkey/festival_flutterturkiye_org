import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tag_highlighting/tag_highlighting.dart';

import 'package:hackathon_flutterturkiye_org/core/styles/theme_helper.dart';
import 'package:hackathon_flutterturkiye_org/core/utils/responsive_helper.dart';
import 'package:hackathon_flutterturkiye_org/widgets/responsive_builder.dart';

const double _fontSizeSmall = 24.0;
const double _fontSizeMedium = 48.0;
const double _fontSizeLarge = 72.0;

const double _paddingSmall = 24.0;
const double _paddingMedium = 48.0;
const double _paddingLarge = 72.0;

final DateTime _eventStartingDate = DateTime(2021, 3, 6, 10, 0);
final DateTime _eventDueDate = DateTime(2021, 3, 7, 20, 0);

class CountdownSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(color: Colors.black),
      height: screenSize.height,
      padding: _padding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CountdownTitle(),
          SizedBox(height: screenSize.height * 0.1),
          const CountdownWidget(),
        ],
      ),
    );
  }

  EdgeInsets _padding(BuildContext context) {
    if (ResponsiveHelper.isLargeScreen(context)) {
      return EdgeInsets.symmetric(horizontal: _paddingLarge);
    } else if (ResponsiveHelper.isMediumScreen(context)) {
      return EdgeInsets.symmetric(horizontal: _paddingMedium);
    } else {
      return EdgeInsets.symmetric(horizontal: _paddingSmall);
    }
  }
}

class CountdownTitle extends StatelessWidget {
  const CountdownTitle();

  final String text =
      "Türkiye'nin en büyük\n<bold>Flutter Festivali</bold> başlıyor";

  @override
  Widget build(BuildContext context) {
    return _CountdownText(text: text);
  }
}

class CountdownWidget extends StatefulWidget {
  const CountdownWidget();

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _setTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();
    final remainingTime = _eventStartingDate.difference(currentDate);
    final text = "<bold>${remainingTime.inDays}</bold> gün " +
        "<bold>${remainingTime.inHours % 24}</bold> saat " +
        "<bold>${remainingTime.inMinutes % 60}</bold> dakika " +
        "<bold>${remainingTime.inSeconds % 60}</bold> saniye kaldı";

    return _CountdownText(text: text);
  }

  _setTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {});
      },
    );
  }
}

class _CountdownText extends StatelessWidget {
  final String text;
  final String tagName;

  const _CountdownText({
    Key key,
    @required this.text,
    this.tagName = 'bold',
  })  : assert(text != null),
        assert(tagName != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      smallWidget: _CountdownTextHighlighting(
        text: text,
        fontSize: _fontSizeSmall,
      ),
      mediumWidget: _CountdownTextHighlighting(
        text: text,
        fontSize: _fontSizeMedium,
      ),
      largeWidget: _CountdownTextHighlighting(
        text: text,
        fontSize: _fontSizeLarge,
      ),
    );
  }
}

class _CountdownTextHighlighting extends StatelessWidget {
  const _CountdownTextHighlighting({
    Key key,
    @required this.text,
    this.tagName = 'bold',
    this.fontSize,
  })  : assert(text != null),
        assert(tagName != null),
        super(key: key);

  final String text;
  final String tagName;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return TagHighlighting(
      text: text,
      textAlign: TextAlign.center,
      defaultTextStyle: TextStyle(
        color: ThemeHelper.lightColor,
        fontSize: fontSize,
      ),
      tags: [
        TagHighlight(
          tagName: tagName,
          textStyle: TextStyle(
            color: ThemeHelper.lightColor,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
