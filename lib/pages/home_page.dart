import 'package:festival_flutterturkiye_org/core/model/navigation_action.dart';
import 'package:festival_flutterturkiye_org/navigation/ui/website_navigation.dart';
import 'package:festival_flutterturkiye_org/countdown/ui/countdown_section.dart';
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
  final List<NavigationAction> navigationActions = [
    NavigationAction(
      'Konuşmacılar',
      Icons.group_rounded,
      () {},
    ),
    NavigationAction(
      'Etkinlik Programı',
      Icons.event_rounded,
      () {},
    ),
    NavigationAction(
      'Etkinlik',
      Icons.celebration,
      () {},
    ),
    NavigationAction(
      'Sponsorlar',
      Icons.help_center_rounded,
      () {},
    ),
    NavigationAction(
      'SSS',
      Icons.help_center_rounded,
      () {},
    ),
    NavigationAction(
      'İletişim',
      Icons.phone_in_talk_rounded,
      () {},
    ),
    NavigationAction(
      'Kayıt Ol',
      Icons.account_circle_rounded,
      () {},
      isFilled: true,
    ),
  ];
  final ScrollController _scrollController = ScrollController();
  bool isScrolling = false;

  @override
  void initState() {
    super.initState();
    _initializeScrollController();
  }

  void _initializeScrollController() {
    _scrollController.addListener(() {
      if (_scrollController.offset == 0.0 &&
          !_scrollController.position.outOfRange &&
          mounted) {
        setState(() => isScrolling = false);
      }
      if (_scrollController.offset >= _scrollOffset &&
          !_scrollController.position.outOfRange &&
          mounted) {
        setState(() => isScrolling = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height),
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
            WebsiteNavigation(
              actions: navigationActions,
              hasTransparentBackground: isScrolling,
            ),
          ],
        ),
        backgroundColor: Colors.white,
      );

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
