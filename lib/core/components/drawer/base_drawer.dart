import 'package:flutter/material.dart';

import '../../model/app_bar_and_drawer_item_model.dart';
import 'drawer_list_tile.dart';

class BaseDrawer extends StatelessWidget {
  final List<AppBarAndDrawerItemModel> drawerList;

  const BaseDrawer({
    Key key,
    @required this.drawerList,
  })  : assert(drawerList != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 20.0),
        itemCount: drawerList.length,
        itemBuilder: (BuildContext context, int index) {
          return DrawerListTile(
            title: '${drawerList[index].title}',
            icon: drawerList[index].icon,
            onTapListTile: drawerList[index].onPressed,
          );
        },
      ),
    );
  }
}
