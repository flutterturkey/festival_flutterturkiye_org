import 'package:flutter/material.dart';

class ActivityFlowIcon extends StatelessWidget {
  const ActivityFlowIcon({
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
