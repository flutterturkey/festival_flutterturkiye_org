import 'package:festival_flutterturkiye_org/core/styles/theme_helper.dart';
import 'package:festival_flutterturkiye_org/core/utils/responsive_helper.dart';
import 'package:festival_flutterturkiye_org/widgets/speaker_detail/speaker_detail.dart';
import 'package:flutter/material.dart';

class SpeakerDetailSubTitle extends StatelessWidget {
  const SpeakerDetailSubTitle({
    @required this.title,
    Key key,
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
            fontSize: 28,
          ),
        ),
        AdjustableWidthDivider(width: dividerWidth, thickness: 4),
        const SizedBox(height: 16),
      ],
    );
  }
}
