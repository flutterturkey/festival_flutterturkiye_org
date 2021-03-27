import 'package:flutter/material.dart';

import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';

class ActivityFlowSubtitle extends StatelessWidget {
  const ActivityFlowSubtitle({
    @required this.subtitle,
    Key key,
  })  : assert(subtitle != null),
        super(key: key);

  final String subtitle;

  @override
  Widget build(BuildContext context) => Text(
        subtitle,
        textAlign: TextAlign.start,
        style: const TextStyle(
          color: ThemeHelper.activityFlowColor,
          fontWeight: FontWeight.w200,
          fontSize: 16,
        ),
      );
}
