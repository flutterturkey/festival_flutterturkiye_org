import 'package:festival_flutterturkiye_org/core/styles/theme_helper.dart';
import 'package:festival_flutterturkiye_org/core/components/app_bar/app_bar_title.dart';

import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget with PreferredSizeWidget {
  final bool isAppbarCollapsing;
  final List<Widget> actions;
  final Widget leading;
  final bool isCenterTitle;

  const BaseAppBar({
    Key key,
    @required this.isAppbarCollapsing,
    @required this.actions,
    this.leading,
    this.isCenterTitle = false,
  })  : assert(isAppbarCollapsing != null),
        assert(actions != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          isAppbarCollapsing ? ThemeHelper.darkColor : Colors.transparent,
      elevation: isAppbarCollapsing ? 10 : 0,
      automaticallyImplyLeading: false,
      title: AppBarTitle(),
      centerTitle: isCenterTitle,
      actions: actions,
      leading: leading ?? SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
