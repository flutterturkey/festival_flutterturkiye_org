import 'package:flutter/material.dart';

import 'package:festival_flutterturkiye_org/core/utils/image_assets.dart';

class ActivityFlowLineIndicatorBuilder extends StatelessWidget {
  const ActivityFlowLineIndicatorBuilder({
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
    if (index.isEven) {
      return const ActivityFlowLineIndicator(ImageAssets.lineIndicatorTop);
    } else if (isLastIndex) {
      return const SizedBox.shrink();
    } else if (index.isOdd) {
      return const ActivityFlowLineIndicator(ImageAssets.lineIndicatorBottom);
    } else {
      return const SizedBox.shrink();
    }
  }
}

class ActivityFlowLineIndicator extends StatelessWidget {
  const ActivityFlowLineIndicator(
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
