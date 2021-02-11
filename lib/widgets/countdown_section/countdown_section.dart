import 'package:flutter/material.dart';

import 'package:festival_flutterturkiye_org/core/utils/responsive_helper.dart';
import 'package:festival_flutterturkiye_org/widgets/countdown_section/countdown_exports.dart';

const double _paddingSmall = 24.0;
const double _paddingMedium = 48.0;
const double _paddingLarge = 72.0;

class CountdownSection extends StatelessWidget {
  const CountdownSection();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      height: screenSize.height,
      padding: _padding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const _CountdownTitle(),
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

class _CountdownTitle extends StatelessWidget {
  const _CountdownTitle();

  @override
  Widget build(BuildContext context) {
    final textSpans = <TextSpan>[
      _textSpan("Türkiye'nin en büyük\n"),
      _textSpan('Flutter Festivali', fontWeight: FontWeight.bold),
      _textSpan(' başlıyor'),
    ];
    return CountdownTextBuilder(textSpans: textSpans);
  }

  TextSpan _textSpan(String text, {FontWeight fontWeight}) {
    assert(text != null);
    return TextSpan(
      text: text,
      style: fontWeight != null ? TextStyle(fontWeight: fontWeight) : null,
    );
  }
}
