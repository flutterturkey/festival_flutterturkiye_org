import 'package:festival_flutterturkiye_org/core/logic/speaker_repository.dart';
import 'package:festival_flutterturkiye_org/core/ui/section_title.dart';
import 'package:festival_flutterturkiye_org/core/utils/get_it_initializer.dart';
import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:festival_flutterturkiye_org/speaker/ui/speaker_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpeakerSection extends StatelessWidget {
  SpeakerSection({Key key}) : super(key: key);

  final speakers = getIt.get<SpeakerRepository>().speakers;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            const SectionTitle(
              title: 'Konuşmacılar',
              textColor: ThemeHelper.lightColor,
            ),
            Wrap(
              spacing: 8,
              children: speakers
                  .map(
                    (speaker) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: SpeakerCard(speaker: speaker),
                    ),
                  )
                  .toList(growable: false),
            ),
          ],
        ),
      );
}
