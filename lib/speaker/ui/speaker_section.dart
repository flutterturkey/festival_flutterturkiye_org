import 'package:festival_flutterturkiye_org/core/logic/speaker_repository.dart';
import 'package:festival_flutterturkiye_org/core/ui/section_title.dart';
import 'package:festival_flutterturkiye_org/core/utils/get_it_initializer.dart';
import 'package:festival_flutterturkiye_org/speaker/ui/speaker_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpeakerSection extends StatelessWidget {
  const SpeakerSection({
    required this.focusNode,
    Key? key,
  }) : super(key: key);

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final speakerRepository = getIt.get<SpeakerRepository>();
    return Column(
      children: [
        const SectionTitle(title: 'Konuşmacılar'),
        Wrap(
          spacing: 8,
          children: speakerRepository.speakers
              .map((speaker) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: SpeakerCard(speaker: speaker),
                  ))
              .toList(growable: false),
        ),
      ],
    );
  }
}
