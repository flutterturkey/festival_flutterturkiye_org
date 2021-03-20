part of 'home_page.dart';

extension AppBarView on _HomePageState {
  void initAppBarWidgetList() {
    appBarWidgetList.add(AppBarActionButton(
      title: 'Konuşmacılar',
      onPressed: () {},
    ));
    appBarWidgetList.add(AppBarActionButton(
      title: 'Etkinlik Programı',
      onPressed: () {},
    ));
    appBarWidgetList.add(AppBarActionButton(
      title: 'Sponsorlar',
      onPressed: () {},
    ));
    appBarWidgetList.add(AppBarActionButton(
      title: 'SSS',
      onPressed: () {},
    ));
    appBarWidgetList.add(AppBarActionButton(
      title: 'İletişim',
      onPressed: () {},
    ));
    appBarWidgetList.add(buildSignInButton);
    appBarWidgetList.add(const SizedBox(width: 50));
  }

  Widget get buildSignInButton {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 5.0),
      child: SignInButton(fontSize: 15),
    );
  }

  Widget get buildAppBar {
    if (MediaQuery.of(context).size.width > 800) {
      return buildAppBarWeb;
    } else {
      return buildAppBarMobile;
    }
  }

  Widget get buildAppBarWeb {
    return BaseAppBar(
      actions: appBarWidgetList,
    );
  }

  Widget get buildAppBarMobile {
    return BaseAppBar(
      actions: [],
      isCenterTitle: true,
      leading: buildDrawerButton,
    );
  }
}
