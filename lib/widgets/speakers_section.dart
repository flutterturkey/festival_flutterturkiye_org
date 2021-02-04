import 'package:flutter/material.dart';
import 'package:hackathon_flutterturkiye_org/widgets/speaker_card.dart';

Widget speakersSection(BuildContext ctx) {
  double screenWidth = MediaQuery.of(ctx).size.width;
  return GridView.count(
    shrinkWrap: true,
    primary: false,
    physics: NeverScrollableScrollPhysics(),
    mainAxisSpacing: 20,
    crossAxisSpacing: 20,
    padding: const EdgeInsets.all(10.0),
    crossAxisCount: calculateCrossAxisCount(screenWidth),
    childAspectRatio: calculateAscpectRatio(screenWidth),
    children: List.generate(9, (index) {
      return SpeakerCard(ctx: ctx);
    }),
  );
}

double calculateAscpectRatio(double width) {
  double ratio = 0;
  if (width >= 1200) {
    ratio = (width / 3) / 144;
  } else if (width >= 1000) {
    ratio = width / 220;
  } else {
    ratio = width / 144;
  }

  return ratio;
}

int calculateCrossAxisCount(double width) {
  int crossAxisCount = 0;
  if (width >= 1200) {
    crossAxisCount = 3;
  } else if (width >= 1000) {
    crossAxisCount = 2;
  } else {
    crossAxisCount = 1;
  }

  return crossAxisCount;
}
