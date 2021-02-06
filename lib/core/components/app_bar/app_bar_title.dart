import 'package:flutter/material.dart';

import '../../constants/app_images.dart';

class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImages.instance.logo);
  }
}
