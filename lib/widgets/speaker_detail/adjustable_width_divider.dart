import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';

class AdjustableWidthDivider extends StatelessWidget {
  const AdjustableWidthDivider({
    @required this.width,
    @required this.thickness,
    Key key,
  })  : assert(width != null),
        assert(thickness != null),
        super(key: key);

  final double width;
  final double thickness;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        child: Divider(
          thickness: thickness,
          color: ThemeHelper.lightColor,
          height: 16,
        ),
      );
}
