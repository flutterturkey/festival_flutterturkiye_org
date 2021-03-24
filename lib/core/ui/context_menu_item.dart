import 'package:flutter/material.dart';

class ContextMenuItem extends StatelessWidget {
  const ContextMenuItem({
    @required this.title,
    @required this.icon,
    @required this.onTap,
    Key key,
  })  : assert(title != null),
        assert(icon != null),
        assert(onTap != null),
        super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onTap;

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
        onTap: onTap,
      );
}
