import 'package:festival_flutterturkiye_org/core/model/app_bar_and_drawer_item.dart';
import 'package:festival_flutterturkiye_org/core/styles/theme_helper.dart';
import 'package:festival_flutterturkiye_org/core/ui/app_bar/app_bar_action_button.dart';
import 'package:festival_flutterturkiye_org/core/ui/app_bar/app_bar_title.dart';
import 'package:festival_flutterturkiye_org/core/ui/drawer/drawer_list_tile.dart';
import 'package:festival_flutterturkiye_org/widgets/countdown_section/countdown_exports.dart';
import 'package:festival_flutterturkiye_org/widgets/countdown_section/countdown_section.dart';
import 'package:festival_flutterturkiye_org/widgets/event_flow_section/event_flow_section.dart';
import 'package:festival_flutterturkiye_org/widgets/footer_view.dart';
import 'package:festival_flutterturkiye_org/widgets/section_title.dart';
import 'package:festival_flutterturkiye_org/widgets/speakers_section.dart';
import 'package:flutter/material.dart';

const _scrollOffset = 12.0;

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<AppBarAndDrawerItem> pageSectionsList = [
    AppBarAndDrawerItem(
      'Konuşmacılar',
      Icons.group_rounded,
      () {},
    ),
    AppBarAndDrawerItem(
      'Etkinlik Programı',
      Icons.event_rounded,
      () {},
    ),
    AppBarAndDrawerItem(
      'Etkinlik',
      Icons.celebration,
      () {},
    ),
    AppBarAndDrawerItem(
      'SSS',
      Icons.help_center_rounded,
      () {},
    ),
    AppBarAndDrawerItem(
      'İletişim',
      Icons.phone_in_talk_rounded,
      () {},
    ),
    AppBarAndDrawerItem(
      'Kayıt Ol',
      Icons.account_circle_rounded,
      () {},
      isFilled: true,
    ),
  ];
  final ScrollController scrollController = ScrollController();
  bool isAppbarCollapsing = false;

  @override
  void initState() {
    super.initState();
    _initializeScrollController();
  }

  void _initializeScrollController() {
    scrollController.addListener(() {
      if (scrollController.offset == 0.0 &&
          !scrollController.position.outOfRange &&
          mounted) {
        setState(() => isAppbarCollapsing = false);
      }
      if (scrollController.offset >= _scrollOffset &&
          !scrollController.position.outOfRange &&
          mounted) {
        setState(() => isAppbarCollapsing = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _scaffoldKey,
        extendBodyBehindAppBar: true,
        appBar: (MediaQuery.of(context).size.width > 800)
            ? buildAppBarWeb
            : buildAppBarMobile,
        body: SingleChildScrollView(
          controller: scrollController,
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  CountdownSection(),
                  SectionTitle(title: 'Konuşmacılar'),
                  SpeakersSection(),
                  EventFlowSection(),
                  FooterView(),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        drawer: (MediaQuery.of(context).size.width > 800)
            ? const SizedBox.shrink()
            : Drawer(
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 20),
                  itemCount: pageSectionsList.length,
                  itemBuilder: (context, index) => DrawerListTile(
                    title: pageSectionsList[index].title,
                    icon: pageSectionsList[index].icon,
                    onTapListTile: pageSectionsList[index].onPressed,
                  ),
                ),
              ),
      );

  List<Widget> get pageSectionsListActions => List.generate(
        pageSectionsList.length,
        (index) => AppBarActionButton(
          title: pageSectionsList[index].title,
          onPressed: pageSectionsList[index].onPressed,
          isFilledButton: pageSectionsList[index].isFilled ?? false,
        ),
      );

  Widget get buildAppBarWeb => AppBar(
        backgroundColor:
            isAppbarCollapsing ? ThemeHelper.darkColor : Colors.transparent,
        elevation: isAppbarCollapsing ? 10 : 0,
        automaticallyImplyLeading: false,
        title: const AppBarTitle(),
        actions: pageSectionsListActions,
      );

  Widget get buildAppBarMobile => AppBar(
        backgroundColor:
            isAppbarCollapsing ? ThemeHelper.darkColor : Colors.transparent,
        elevation: isAppbarCollapsing ? 10 : 0,
        leading: buildDrawerButton,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const AppBarTitle(),
      );

  IconButton get buildDrawerButton => IconButton(
        icon: const Icon(Icons.menu_rounded),
        onPressed: () => _scaffoldKey.currentState.openDrawer(),
      );
}
