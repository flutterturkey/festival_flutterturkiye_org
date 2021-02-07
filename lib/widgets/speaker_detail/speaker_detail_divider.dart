import 'package:flutter/material.dart';
import 'package:hackathon_flutterturkiye_org/core/styles/theme_helper.dart';

class SpeakerDetailDivider extends StatelessWidget {
  final double width;

  const SpeakerDetailDivider({Key key, @required this.width})
      : assert(width != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 4,
      color: ThemeHelper.lightColor,
    );
  }
}
