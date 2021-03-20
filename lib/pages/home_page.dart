import 'package:festival_flutterturkiye_org/widgets/countdown_section/countdown_exports.dart';
import 'package:festival_flutterturkiye_org/widgets/event_flow_section/event_flow_section.dart';
import 'package:festival_flutterturkiye_org/widgets/sign_in_button.dart';
import 'package:festival_flutterturkiye_org/widgets/countdown_section/countdown_section.dart';
import 'package:festival_flutterturkiye_org/core/model/app_bar_and_drawer_item_model.dart';
import 'package:festival_flutterturkiye_org/widgets/footer_view.dart';
import 'package:festival_flutterturkiye_org/widgets/section_title.dart';
import 'package:festival_flutterturkiye_org/widgets/speakers_section.dart';
import 'package:festival_flutterturkiye_org/core/components/app_bar/app_bar_action_button.dart';
import 'package:festival_flutterturkiye_org/core/components/drawer/base_drawer.dart';
import 'package:festival_flutterturkiye_org/core/components/app_bar/base_app_bar.dart';

import 'package:flutter/material.dart';

part 'app_bar_view.dart';
part 'drawer_view.dart';

const _scrolloffset = 12.0;

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController scrollController = ScrollController();
  bool isAppbarCollapsing = false;
  final List<DrawerItemModel> drawerWidgetList = [];
  final List<Widget> appBarWidgetList = [];

  @override
  void initState() {
    super.initState();

    initAppBarWidgetList();
    initDrawerWidgetList();
    _initializeScrollController();
  }

  void _initializeScrollController() {
    scrollController.addListener(() {
      if (scrollController.offset == 0.0 &&
          !scrollController.position.outOfRange) {
        if (!mounted) return;
        setState(() => isAppbarCollapsing = false);
      }
      if (scrollController.offset >= _scrolloffset &&
          !scrollController.position.outOfRange) {
        if (!mounted) return;
        setState(() => isAppbarCollapsing = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              children: <Widget>[
                CountdownSection(),
                SectionTitle(title: 'Konuşmacılar'),
                SpeakersSection(),
                const EventFlowSection(),
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
              drawerList: drawerWidgetList,
            ),
    );
  }
}
