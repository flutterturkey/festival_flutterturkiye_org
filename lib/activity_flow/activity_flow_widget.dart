import 'package:flutter/material.dart';

import 'package:festival_flutterturkiye_org/activity_flow/activity_flow_icon.dart';
import 'package:festival_flutterturkiye_org/activity_flow/activity_flow_line_indicator.dart';
import 'package:festival_flutterturkiye_org/activity_flow/activity_flow_subtitle.dart';
import 'package:festival_flutterturkiye_org/activity_flow/activity_flow_title.dart';

class ActivityFlowWidget extends StatelessWidget {
  const ActivityFlowWidget({
    @required this.title,
    @required this.subtitle,
    @required this.iconPath,
    @required this.index,
    @required this.isLastIndex,
    Key key,
  })  : assert(title != null),
        assert(subtitle != null),
        assert(iconPath != null),
        assert(index != null),
        assert(isLastIndex != null),
        super(key: key);

  final String title;
  final String subtitle;
  final String iconPath;
  final int index;
  final bool isLastIndex;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 8),
        child: SizedBox(
          width: 240,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _BuildRowHeader(
                index: index,
                isLastIndex: isLastIndex,
                iconPath: iconPath,
              ),
              const SizedBox(height: 10),
              ActivityFlowTitle(title: title),
              ActivityFlowSubtitle(subtitle: subtitle),
            ],
          ),
        ),
      );
}

class _BuildRowHeader extends StatelessWidget {
  const _BuildRowHeader({
    @required this.iconPath,
    @required this.index,
    @required this.isLastIndex,
    Key key,
  })  : assert(iconPath != null),
        assert(index != null),
        assert(isLastIndex != null),
        super(key: key);

  final String iconPath;
  final int index;
  final bool isLastIndex;

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment:
            (index.isEven) ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          ActivityFlowIcon(iconPath: iconPath),
          const SizedBox(width: 10),
          ActivityFlowLineIndicatorBuilder(
            index: index,
            isLastIndex: isLastIndex,
          ),
        ],
      );
}
