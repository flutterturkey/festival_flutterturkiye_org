import 'package:flutter/material.dart';
import 'package:hackathon_flutterturkiye_org/core/styles/theme_helper.dart';
import 'package:hackathon_flutterturkiye_org/core/utils/responsive_helper.dart';
import 'package:hackathon_flutterturkiye_org/widgets/speaker_detail/speaker_detail.dart';

class SpeakerDetailSubTitle extends StatelessWidget {
  const SpeakerDetailSubTitle({
    Key key,
    @required this.title,
  })  : assert(title != null),
        super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    var dividerWidth = screenSize.width * 0.1;

    if (ResponsiveHelper.isSmallScreen(context)) {
      dividerWidth = screenSize.width;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: ThemeHelper.lightColor,
            fontWeight: FontWeight.w500,
            fontSize: 28.0,
          ),
        ),
        AdjustableWidthDivider(width: dividerWidth, thickness: 4.0),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
