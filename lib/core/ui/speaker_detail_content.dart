import 'package:festival_flutterturkiye_org/core/model/speaker.dart';
import 'package:festival_flutterturkiye_org/core/ui/speaker_image.dart';
import 'package:festival_flutterturkiye_org/core/utils/responsive_helper.dart';
import 'package:festival_flutterturkiye_org/core/utils/string_formatter.dart';
import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SpeakerDetailContent extends StatelessWidget {
  const SpeakerDetailContent({
    required this.speaker,
    Key? key,
  }) : super(key: key);
  final Speaker speaker;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        primary: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _SpeakerHeader(speaker: speaker),
            const SizedBox(height: 16),
            const Text(
              'Hakkında',
              style: TextStyle(
                color: ThemeHelper.lightColor,
                fontWeight: FontWeight.w500,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              speaker.about?.format() ?? '',
              style: const TextStyle(
                color: ThemeHelper.lightColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
}

class _SpeakerHeader extends StatelessWidget {
  const _SpeakerHeader({
    required this.speaker,
    Key? key,
  }) : super(key: key);

  final Speaker speaker;

  @override
  Widget build(BuildContext context) {
    if (ResponsiveHelper.isSmallScreen(context)) {
      return Wrap(
        alignment: WrapAlignment.center,
        children: [
          SpeakerImage(
            speakerImage: speaker.image,
            imageSize: 120,
            borderSize: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 4, right: 4),
            child: _SpeakerInfo(speaker: speaker, textAlign: TextAlign.center),
          ),
        ],
      );
    }

    return Row(
      children: [
        SpeakerImage(
          speakerImage: speaker.image,
          imageSize: 144,
          borderSize: 4,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _SpeakerInfo(
              speaker: speaker,
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }
}

class _SpeakerInfo extends StatelessWidget {
  const _SpeakerInfo({
    required this.speaker,
    this.textAlign = TextAlign.start,
    Key? key,
  }) : super(key: key);

  final Speaker speaker;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: textAlign == TextAlign.center
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Text(
            speaker.name ?? '',
            textAlign: textAlign,
            softWrap: true,
            style: const TextStyle(
              color: ThemeHelper.lightColor,
              fontWeight: FontWeight.w600,
              fontSize: 36,
            ),
          ),
          Text(
            speaker.title ?? '',
            textAlign: textAlign,
            softWrap: true,
            style: const TextStyle(
              color: ThemeHelper.lightColor,
              fontWeight: FontWeight.w300,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: textAlign == TextAlign.center
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              _SocialMediaButton(
                icon: MdiIcons.github,
                url: 'https://www.github.com/${speaker.github}',
              ),
              _SocialMediaButton(
                icon: MdiIcons.linkedin,
                url: 'https://www.linkedin.com/in/${speaker.linkedin}',
              ),
              _SocialMediaButton(
                icon: MdiIcons.twitter,
                url: 'https://www.twitter.com/${speaker.twitter}',
              ),
            ],
          ),
        ],
      );
}

class _SocialMediaButton extends StatelessWidget {
  const _SocialMediaButton({
    required this.icon,
    required this.url,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final String url;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: 8),
        child: ClipOval(
          child: Material(
            elevation: 8,
            shadowColor: Colors.black,
            color: Colors.white10,
            child: InkWell(
              onTap: () async {
                if (await canLaunch(url)) {
                  await launch(url);
                }
              },
              hoverColor: ThemeHelper.speakerDetailImageBorder,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(icon, color: ThemeHelper.lightColor, size: 24),
              ),
            ),
          ),
        ),
      );
}
