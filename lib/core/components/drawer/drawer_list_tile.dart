import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTapListTile;

  const DrawerListTile({
    Key key,
    @required this.title,
    @required this.icon,
    @required this.onTapListTile,
  })  : assert(title != null),
        assert(icon != null),
        assert(onTapListTile != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '$title',
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
}
