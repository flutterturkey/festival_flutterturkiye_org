import 'package:festival_flutterturkiye_org/widgets/speaker_card.dart';
import 'package:flutter/material.dart';

class SpeakersSection extends StatelessWidget {
  const SpeakersSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GridView.builder(
        shrinkWrap: true,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(10),
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500,
          mainAxisExtent: 130,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) => const SpeakerCard(),
      );
}
