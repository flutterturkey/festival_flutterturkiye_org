import 'package:flutter/material.dart';
import 'package:hackathon_flutterturkiye_org/core/styles/theme_helper.dart';
import 'package:hackathon_flutterturkiye_org/core/utils/responsive_helper.dart';
import 'package:hackathon_flutterturkiye_org/widgets/speaker_detail/speaker_detail.dart';

class SpeakerDetailHeader extends StatelessWidget {
  const SpeakerDetailHeader({
    Key key,
    @required this.speakerImage,
    @required this.speakerName,
    this.speakerCompany,
    this.speakerTwitter,
    this.speakerGithub,
    this.speakerLinkedIn,
  }) : super(key: key);

  final String speakerImage;
  final String speakerName;
  final String speakerCompany;
  final String speakerTwitter;
  final String speakerGithub;
  final String speakerLinkedIn;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    if (ResponsiveHelper.isSmallScreen(context)) {
      return _smallWidget(screenSize);
    } else {
      return _largeWidget(screenSize);
    }
  }

  Widget _smallWidget(Size size) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _SpeakerImage(
            speakerImage: speakerImage,
            imageSize: size.width * 0.8,
          ),
          const SizedBox(height: 16.0),
          SpeakerInformation(
            speakerName: speakerName,
            speakerCompany: speakerCompany,
            speakerTwitter: speakerTwitter,
            speakerGithub: speakerGithub,
            speakerLinkedIn: speakerLinkedIn,
          ),
        ],
      );

  Widget _largeWidget(Size size) => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _SpeakerImage(
            speakerImage: speakerImage,
            imageSize: 256,
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: SpeakerInformation(
              speakerName: speakerName,
              speakerCompany: speakerCompany,
              speakerTwitter: speakerTwitter,
              speakerGithub: speakerGithub,
              speakerLinkedIn: speakerLinkedIn,
            ),
          ),
        ],
      );
}

class _SpeakerImage extends StatelessWidget {
  const _SpeakerImage({
    Key key,
    @required this.speakerImage,
    @required this.imageSize,
  })  : assert(speakerImage != null),
        assert(imageSize != null),
        super(key: key);

  final String speakerImage;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: imageSize,
      width: imageSize,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(speakerImage),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
        border: Border.all(
          color: ThemeHelper.eventPointColor,
          width: 4,
        ),
      ),
    );
  }
}
