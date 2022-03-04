import 'package:festival_flutterturkiye_org/core/model/navigation_action.dart';
import 'package:festival_flutterturkiye_org/core/ui/app_logo.dart';
import 'package:festival_flutterturkiye_org/core/ui/context_menu_item.dart';
import 'package:festival_flutterturkiye_org/core/ui/generic_button.dart';
import 'package:festival_flutterturkiye_org/core/ui/responsive_builder.dart';
import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';

class WebsiteNavigation extends StatefulWidget {
  const WebsiteNavigation({
    this.actions = const <NavigationAction>[],
    this.hasTransparentBackground = false,
    Key? key,
  }) : super(key: key);

  final List<NavigationAction> actions;
  final bool hasTransparentBackground;

  @override
  _WebsiteNavigationState createState() => _WebsiteNavigationState();
}

class _WebsiteNavigationState extends State<WebsiteNavigation> {
  bool _isContextMenuVisible = false;

  @override
  Widget build(BuildContext context) => ResponsiveBuilder(
        smallWidget: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: widget.hasTransparentBackground || _isContextMenuVisible
                ? ThemeHelper.darkColor
                : Colors.transparent,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: kToolbarHeight,
                child: Row(
                  children: [
                    IconButton(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      icon: const Icon(
                        Icons.menu_rounded,
                        color: Colors.white,
                        size: 36,
                      ),
                      onPressed: () {
                        setState(() {
                          _isContextMenuVisible = !_isContextMenuVisible;
                        });
                      },
                    ),
                    const Expanded(child: AppLogo()),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: SizedBox(
                        height: 36,
                        width: 36,
                      ),
                    )
                  ],
                ),
              ),
              if (_isContextMenuVisible)
                ...widget.actions
                    .map(
                      (action) => ContextMenuItem(
                          title: action.title,
                          icon: action.icon,
                          onTap: action.onPressed),
                    )
                    .toList(growable: false)
            ],
          ),
        ),
        largeWidget: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: kToolbarHeight,
          decoration: BoxDecoration(
            color: widget.hasTransparentBackground
                ? ThemeHelper.darkColor
                : Colors.transparent,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppLogo(),
              Row(
                children: widget.actions
                    .map(
                      (action) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: GenericButton(
                          title: action.title,
                          onPressed: action.onPressed,
                          isFilledButton: action.isFilled,
                          textPadding: const EdgeInsets.all(8),
                        ),
                      ),
                    )
                    .toList(growable: false),
              )
            ],
          ),
        ),
        mediumWidget: const SizedBox(),
      );
}
