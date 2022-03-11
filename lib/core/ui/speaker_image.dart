import 'package:festival_flutterturkiye_org/core/ui/circle_image_with_border.dart';
import 'package:festival_flutterturkiye_org/core/utils/assets.dart';
import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';

class SpeakerImage extends StatelessWidget {
  const SpeakerImage({
    required this.imageSize,
    this.speakerImage,
    this.borderSize = 2,
    Key? key,
  }) : super(key: key);

  final String? speakerImage;
  final double imageSize;
  final double borderSize;

  @override
  Widget build(BuildContext context) => CircleImageWithBorder(
        image: ImageAsset(
          speakerImage ?? 'dashatar.png',
          subfolder: 'speakers',
        ).toString(),
        imageSize: imageSize,
        borderSize: borderSize,
        borderColor: ThemeHelper.speakerDetailImageBorder,
      );
}
