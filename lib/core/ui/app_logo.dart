import 'package:festival_flutterturkiye_org/core/utils/image_assets.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Image.asset(
        ImageAssets.logo,
        scale: 2,
      );
}
