import 'package:flutter/material.dart';
import 'package:hackathon_flutterturkiye_org/widgets/speaker_card.dart';

class SpeakersSection extends StatelessWidget {
  const SpeakersSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10.0),
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 500.0,
        mainAxisExtent: 130,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return SpeakerCard();
      },
    );
  }
}
