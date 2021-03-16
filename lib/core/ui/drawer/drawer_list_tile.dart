import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    @required this.title,
    @required this.icon,
    @required this.onTapListTile,
    Key key,
  })  : assert(title != null),
        assert(icon != null),
        assert(onTapListTile != null),
        super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onTapListTile;

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        leading: Icon(
          icon ?? Icons.warning,
          color: Colors.white,
        ),
        onTap: onTapListTile,
      );
}
