import 'dart:async';

import 'package:flutter/material.dart';

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

class CountdownSection extends StatelessWidget {
  const CountdownSection();

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
          CountdownWidget(),
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

  @override
  Widget build(BuildContext context) {
    final textSpans = <TextSpan>[
      _textSpan("Türkiye'nin en büyük\n"),
      _textSpan('Flutter Festivali', fontWeight: FontWeight.bold),
      _textSpan(' başlıyor'),
    ];
    return _CountdownTextBuilder(textSpans: textSpans);
  }

  TextSpan _textSpan(String text, {FontWeight fontWeight}) {
    return TextSpan(
      text: text,
      style: fontWeight != null ? TextStyle(fontWeight: fontWeight) : null,
    );
  }
}

class CountdownWidget extends StatelessWidget {
  CountdownWidget();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration>(
        stream: getCountdown(),
        initialData: _calculateRemainingTime(),
        builder: (context, remainingTimeSnapshot) {
          if (remainingTimeSnapshot.hasData) {
            final textSpans = <TextSpan>[
              _textSpan(
                '${_dateFixer(remainingTimeSnapshot.data.inDays)}',
                fontWeight: FontWeight.bold,
              ),
              _textSpan(' gün '),
              _textSpan(
                '${_dateFixer(remainingTimeSnapshot.data.inHours % 24)}',
                fontWeight: FontWeight.bold,
              ),
              _textSpan(' saat '),
              _textSpan(
                '${_dateFixer(remainingTimeSnapshot.data.inMinutes % 60)}',
                fontWeight: FontWeight.bold,
              ),
              _textSpan(' dakika '),
              _textSpan(
                '${_dateFixer(remainingTimeSnapshot.data.inSeconds % 60)}',
                fontWeight: FontWeight.bold,
              ),
              _textSpan(' saniye kaldı'),
            ];
            return _CountdownTextBuilder(textSpans: textSpans);
          }
          return SizedBox.shrink();
        });
  }

  Stream<Duration> getCountdown() async* {
    yield* Stream.periodic(Duration(seconds: 1), (_) {
      return _calculateRemainingTime();
    });
  }

  Duration _calculateRemainingTime() =>
      _eventStartingDate.difference(DateTime.now());

  String _dateFixer(int date) => '${date < 10 ? '0' : ''}$date';

  TextSpan _textSpan(String text, {FontWeight fontWeight}) {
    return TextSpan(
      text: text,
      style: fontWeight != null ? TextStyle(fontWeight: fontWeight) : null,
    );
  }
}

class _CountdownTextBuilder extends StatelessWidget {
  final List<TextSpan> textSpans;
  final FontWeight fontWeight;

  _CountdownTextBuilder({
    Key key,
    @required this.textSpans,
    this.fontWeight = FontWeight.normal,
  })  : assert(textSpans != null),
        assert(textSpans.isNotEmpty),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      smallWidget: _CountdownText(
        textSpans: textSpans,
        fontSize: _fontSizeSmall,
      ),
      mediumWidget: _CountdownText(
        textSpans: textSpans,
        fontSize: _fontSizeMedium,
      ),
      largeWidget: _CountdownText(
        textSpans: textSpans,
        fontSize: _fontSizeLarge,
      ),
    );
  }
}

class _CountdownText extends StatelessWidget {
  const _CountdownText({
    Key key,
    @required this.textSpans,
    this.textAlign = TextAlign.center,
    this.fontSize,
  })  : assert(textSpans != null),
        super(key: key);

  final List<TextSpan> textSpans;
  final TextAlign textAlign;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: textSpans,
        style: TextStyle(
          color: ThemeHelper.lightColor,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
