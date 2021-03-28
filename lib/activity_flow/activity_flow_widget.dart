import 'package:flutter/material.dart';

import 'package:festival_flutterturkiye_org/core/utils/image_assets.dart';
import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';

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
              const SizedBox(height: 12),
              _ActivityFlowTitle(title: title),
              _ActivityFlowTitle(title: subtitle, isTitle: false),
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
          _ActivityFlowIcon(iconPath: iconPath),
          const SizedBox(width: 12),
          _ActivityFlowLineIndicatorBuilder(
            index: index,
            isLastIndex: isLastIndex,
          ),
        ],
      );
}

class _ActivityFlowTitle extends StatelessWidget {
  const _ActivityFlowTitle({
    @required this.title,
    this.isTitle = true,
    Key key,
  })  : assert(title != null),
        assert(isTitle != null),
        super(key: key);

  final String title;
  final bool isTitle;

  @override
  Widget build(BuildContext context) => Text(
        title,
        textAlign: TextAlign.start,
        style: isTitle
            ? const TextStyle(
                color: ThemeHelper.activityFlowColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )
            : const TextStyle(
                color: ThemeHelper.activityFlowColor,
                fontWeight: FontWeight.w200,
                fontSize: 16,
              ),
      );
}

class _ActivityFlowIcon extends StatelessWidget {
  const _ActivityFlowIcon({
    @required this.iconPath,
    Key key,
  })  : assert(iconPath != null),
        super(key: key);

  final String iconPath;

  @override
  Widget build(BuildContext context) => CircleAvatar(
        radius: 25,
        backgroundColor: const Color(0xFFF4F5F7),
        child: Image.asset(iconPath, scale: 1.5),
      );
}

class _ActivityFlowLineIndicatorBuilder extends StatelessWidget {
  const _ActivityFlowLineIndicatorBuilder({
    @required this.index,
    @required this.isLastIndex,
    Key key,
  })  : assert(index != null),
        assert(isLastIndex != null),
        super(key: key);

  final int index;
  final bool isLastIndex;

  @override
  Widget build(BuildContext context) {
    if (isLastIndex) {
      print('isLastIndex  -> $index');
      return const SizedBox.shrink();
    } else if (index.isEven) {
      print('isEven  -> $index');
      return const _ActivityFlowLineIndicator(ImageAssets.lineIndicatorTop);
    } else if (index.isOdd) {
      print('isOdd  -> $index');
      return const _ActivityFlowLineIndicator(ImageAssets.lineIndicatorBottom);
    } else {
      print('else  -> $index');
      return const SizedBox.shrink();
    }
  }
}

class _ActivityFlowLineIndicator extends StatelessWidget {
  const _ActivityFlowLineIndicator(
    this.assetsPath, {
    Key key,
  })  : assert(assetsPath != null),
        super(key: key);

  final String assetsPath;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(12),
        child: Image.asset(assetsPath, scale: 1.1),
      );
}
