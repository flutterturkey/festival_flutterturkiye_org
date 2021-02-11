import 'package:flutter/material.dart';
import 'package:festival_flutterturkiye_org/widgets/sign_in_button.dart';
import 'package:festival_flutterturkiye_org/widgets/countdown_section/countdown_section.dart';
import '../core/components/app_bar/app_bar_action_button.dart';
import '../core/components/app_bar/base_app_bar.dart';
import '../core/components/drawer/base_drawer.dart';
import '../core/model/app_bar_and_drawer_item_model.dart';
import '../widgets/footer_view.dart';
import '../widgets/section_title.dart';
import '../widgets/speakers_section.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<AppBarAndDrawerItemModel> pageSectionsList = [];

  @override
  void initState() {
    super.initState();
    initPageSectionList();
  }

  void initPageSectionList() {
    pageSectionsList.add(
      AppBarAndDrawerItemModel('Konuşmacılar', Icons.group_rounded, () {}),
    );
    pageSectionsList.add(
      AppBarAndDrawerItemModel('Etkinlik Programı', Icons.event_rounded, () {}),
    );
    pageSectionsList.add(
      AppBarAndDrawerItemModel('Etkinlik', Icons.celebration, () {}),
    );
    pageSectionsList.add(
      AppBarAndDrawerItemModel('SSS', Icons.help_center_rounded, () {}),
    );
    pageSectionsList.add(
      AppBarAndDrawerItemModel('İletişim', Icons.phone_in_talk_rounded, () {}),
    );
    pageSectionsList.add(
      AppBarAndDrawerItemModel(
        'Kayıt Ol',
        Icons.account_circle_rounded,
        () {},
        isFilled: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: (MediaQuery.of(context).size.width > 800)
          ? buildAppBarWeb
          : buildAppBarMobile,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CountdownSection(),
                Container(
                  width: double.infinity,
                  color: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Column(
                    children: [
                      // For Countdown Section
                      const SignInButton(
                        fontSize: 28.0,
                        padding: EdgeInsets.symmetric(
                          horizontal: 56.0,
                          vertical: 20.0,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      // For AppBar
                      const SignInButton(),
                    ],
                  ),
                ),
                SectionTitle(title: 'Konuşmacılar'),
                SpeakersSection(),
                FooterView(),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      drawer: (MediaQuery.of(context).size.width > 800)
          ? SizedBox.shrink()
          : BaseDrawer(
              drawerList: pageSectionsList,
            ),
    );
  }

  List<Widget> get pageSectionsListActions {
    return List.generate(
      pageSectionsList.length,
      (index) => AppBarActionButton(
        title: pageSectionsList[index].title,
        onPressed: pageSectionsList[index].onPressed,
        isFilledButton: pageSectionsList[index].isFilled ?? false,
      ),
    );
  }

  Widget get buildAppBarWeb {
    return BaseAppBar(
      actions: pageSectionsListActions,
    );
  }

  Widget get buildAppBarMobile {
    return BaseAppBar(
      actions: [],
      isCenterTitle: true,
      leading: buildDrawerButton,
    );
  }

  IconButton get buildDrawerButton {
    return IconButton(
      icon: Icon(Icons.menu_rounded),
      onPressed: () => _scaffoldKey.currentState.openDrawer(),
    );
  }
}
