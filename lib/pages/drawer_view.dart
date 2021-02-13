part of 'home_page.dart';

extension DrawerView on _HomePageState {
  void initDrawerWidgetList() {
    drawerWidgetList.add(
      DrawerItemModel('Konuşmacılar', Icons.group_rounded, () {}),
    );
    drawerWidgetList.add(
      DrawerItemModel('Etkinlik Programı', Icons.event_rounded, () {}),
    );
    drawerWidgetList.add(
      DrawerItemModel('Sponsorlar', Icons.celebration, () {}),
    );
    drawerWidgetList.add(
      DrawerItemModel('SSS', Icons.help_center_rounded, () {}),
    );
    drawerWidgetList.add(
      DrawerItemModel('İletişim', Icons.phone_in_talk_rounded, () {}),
    );
  }

  IconButton get buildDrawerButton {
    return IconButton(
      icon: Icon(Icons.menu_rounded),
      onPressed: () => _scaffoldKey.currentState.openDrawer(),
    );
  }
}
