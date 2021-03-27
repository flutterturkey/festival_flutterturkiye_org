import 'package:flutter/material.dart';

import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';

class ActivityFlowTitle extends StatelessWidget {
  const ActivityFlowTitle({
    @required this.title,
    Key key,
  })  : assert(title != null),
        super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => Text(
        title,
        textAlign: TextAlign.start,
        style: const TextStyle(
          color: ThemeHelper.activityFlowColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      );
}
