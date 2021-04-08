import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';

class SpeakerImage extends StatelessWidget {
  const SpeakerImage({
    @required this.speakerImage,
    @required this.imageSize,
    this.borderSize = 2,
    Key key,
  })  : assert(speakerImage != null),
        assert(imageSize != null),
        assert(borderSize != null),
        super(key: key);

  final String speakerImage;
  final double imageSize;
  final double borderSize;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: imageSize,
        width: imageSize,
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(speakerImage),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
            border: Border.all(
              color: ThemeHelper.speakerDetailImageBorder,
              width: borderSize,
            ),
          ),
        ),
      );
}
