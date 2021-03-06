import 'package:festival_flutterturkiye_org/widgets/countdown_section/countdown_exports.dart';
import 'package:festival_flutterturkiye_org/widgets/event_flow_section/event_flow_section.dart';
import 'package:festival_flutterturkiye_org/widgets/sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:festival_flutterturkiye_org/widgets/countdown_section/countdown_section.dart';
import '../core/components/app_bar/app_bar_action_button.dart';
import '../core/components/app_bar/base_app_bar.dart';
import '../core/components/drawer/base_drawer.dart';
import '../core/model/app_bar_and_drawer_item_model.dart';
import '../widgets/footer_view.dart';
import '../widgets/section_title.dart';
import '../widgets/speakers_section.dart';

const _scrolloffset = 12.0;

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<AppBarAndDrawerItemModel> pageSectionsList = [];
  final ScrollController scrollController = ScrollController();
  bool isAppbarCollapsing = false;

  @override
  void initState() {
    super.initState();
    _initializeScrollController();
    _initPageSectionList();
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

  void _initPageSectionList() {
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
      isAppbarCollapsing: isAppbarCollapsing,
    );
  }

  Widget get buildAppBarMobile {
    return BaseAppBar(
      actions: [],
      isCenterTitle: true,
      leading: buildDrawerButton,
      isAppbarCollapsing: isAppbarCollapsing,
    );
  }

  IconButton get buildDrawerButton {
    return IconButton(
      icon: Icon(Icons.menu_rounded),
      onPressed: () => _scaffoldKey.currentState.openDrawer(),
    );
  }
}
