import 'package:flutter/material.dart';
import 'package:hackathon_flutterturkiye_org/core/styles/theme_helper.dart';

class AdjustableWidthDivider extends StatelessWidget {
  final double width;
  final double thickness;

  const AdjustableWidthDivider({
    Key key,
    @required this.width,
    @required this.thickness,
  })  : assert(width != null),
        assert(thickness != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Divider(
        thickness: thickness,
        color: ThemeHelper.lightColor,
        height: 16,
      ),
    );
  }
}
