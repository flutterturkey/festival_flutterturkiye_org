import 'package:festival_flutterturkiye_org/utils/assets.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.logo,
      scale: 2,
    );
  }
}
