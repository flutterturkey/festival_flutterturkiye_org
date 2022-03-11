import 'package:flutter/material.dart';

const String _boldKey = '**';

class TextSpanUtils {
  const TextSpanUtils._();

  static List<InlineSpan> stringToTextSpans(String text) {
    final splittedText = text.split(_boldKey);

    final textSpans = <InlineSpan>[];

    for (var i = 0; i < splittedText.length; i++) {
      textSpans.add(
        TextSpan(
          text: splittedText[i],
          style: i.isOdd ? const TextStyle(fontWeight: FontWeight.bold) : null,
        ),
      );
    }

    return textSpans;
  }
}
