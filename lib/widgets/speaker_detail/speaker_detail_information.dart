import 'package:flutter/material.dart';
import 'package:hackathon_flutterturkiye_org/core/styles/theme_helper.dart';
import 'package:hackathon_flutterturkiye_org/core/utils/responsive_helper.dart';
import 'package:hackathon_flutterturkiye_org/widgets/speaker_detail/speaker_detail.dart';

class SpeakerInformation extends StatelessWidget {
  const SpeakerInformation({
    Key key,
    @required this.speakerName,
    this.speakerCompany,
    this.speakerTwitter,
    this.speakerGithub,
    this.speakerLinkedIn,
  }) : super(key: key);

  final String speakerName;
  final String speakerCompany;
  final String speakerTwitter;
  final String speakerGithub;
  final String speakerLinkedIn;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    var crossAxisAlignment = CrossAxisAlignment.start;
    var textAlign = TextAlign.start;
    var dividerWidth = screenSize.width * 0.6;
    var speakerNameFontSize = 88.0;

    if (ResponsiveHelper.isMediumScreen(context)) {
      speakerNameFontSize = 72.0;
    } else if (ResponsiveHelper.isSmallScreen(context)) {
      crossAxisAlignment = CrossAxisAlignment.center;
      textAlign = TextAlign.center;
      dividerWidth = screenSize.width * 0.8;
      speakerNameFontSize = 60.0;
    }

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        SpeakerName(
          speakerName: speakerName,
          textAlign: textAlign,
          speakerNameFontSize: speakerNameFontSize,
        ),
        // Divider
        SpeakerDetailDivider(width: dividerWidth),
        // Space
        const SizedBox(height: 16.0),
        // Company
        SpeakerCompany(speakerCompany: speakerCompany, textAlign: textAlign),
        // Space
        const SizedBox(height: 24.0),
        // Social Medias
        SpeakerSocialMedias(
          twitter: speakerTwitter,
          github: speakerGithub,
          linkedin: speakerLinkedIn,
        ),
      ],
    );
  }
}

class SpeakerName extends StatelessWidget {
  const SpeakerName({
    Key key,
    @required this.speakerName,
    @required this.textAlign,
    @required this.speakerNameFontSize,
  }) : super(key: key);

  final String speakerName;
  final TextAlign textAlign;
  final double speakerNameFontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      speakerName,
      textAlign: textAlign,
      style: TextStyle(
        color: ThemeHelper.lightColor,
        fontWeight: FontWeight.w600,
        fontSize: speakerNameFontSize,
      ),
    );
  }
}

class SpeakerCompany extends StatelessWidget {
  const SpeakerCompany({
    Key key,
    @required this.speakerCompany,
    @required this.textAlign,
  }) : super(key: key);

  final String speakerCompany;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      speakerCompany,
      textAlign: textAlign,
      style: const TextStyle(
        color: ThemeHelper.lightColor,
        fontWeight: FontWeight.w300,
        fontSize: 24.0,
      ),
    );
  }
}
