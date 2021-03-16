import 'package:festival_flutterturkiye_org/widgets/countdown_section/countdown_exports.dart';
import 'package:festival_flutterturkiye_org/widgets/responsive_builder.dart';
import 'package:flutter/material.dart';

class CountdownTextBuilder extends StatelessWidget {
  CountdownTextBuilder({
    @required this.textSpans,
    this.fontWeight = FontWeight.normal,
    Key key,
  })  : assert(textSpans != null),
        assert(textSpans.isNotEmpty),
        assert(fontWeight != null),
        super(key: key);

  final List<TextSpan> textSpans;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) => ResponsiveBuilder(
        smallWidget: CountdownText(
          textSpans: textSpans,
          fontSize: fontSizeSmall,
        ),
        mediumWidget: CountdownText(
          textSpans: textSpans,
          fontSize: fontSizeMedium,
        ),
        largeWidget: CountdownText(
          textSpans: textSpans,
          fontSize: fontSizeLarge,
        ),
      );
}
