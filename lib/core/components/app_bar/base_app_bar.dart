import 'package:festival_flutterturkiye_org/core/styles/theme_helper.dart';
import 'package:flutter/material.dart';

import 'app_bar_title.dart';

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
      backgroundColor: isAppbarCollapsing
          ? ThemeHelper.cardBackgroundColor
          : Colors.transparent,
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
