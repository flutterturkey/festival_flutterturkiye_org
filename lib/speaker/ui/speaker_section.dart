import 'package:festival_flutterturkiye_org/core/model/speaker.dart';
import 'package:festival_flutterturkiye_org/core/ui/section_title.dart';
import 'package:festival_flutterturkiye_org/speaker/ui/speaker_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpeakerSection extends StatelessWidget {
  const SpeakerSection({
    @required this.speakers,
    Key key,
  })  : assert(speakers != null),
        super(key: key);

  final List<Speaker> speakers;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const SectionTitle(title: 'Konuşmacılar'),
          Wrap(
            spacing: 8,
            children: speakers.map(
              (speaker) => Padding(
                padding: const EdgeInsets.all(8),
                child: SpeakerCard(speaker: speaker),
              ),
            ).toList(growable: false),
          ),
        ],
      );
}
