import 'package:festival_flutterturkiye_org/event_flow/ui/event_flow_section.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:festival_flutterturkiye_org/core/model/navigation_action.dart';
import 'package:festival_flutterturkiye_org/countdown/ui/countdown_section.dart';
import 'package:festival_flutterturkiye_org/faq/ui/faq_section.dart';
import 'package:festival_flutterturkiye_org/footer/ui/footer_section.dart';
import 'package:festival_flutterturkiye_org/navigation/ui/website_navigation.dart';
import 'package:festival_flutterturkiye_org/sponsor/ui/sponsor_section.dart';

const _scrollOffset = 12.0;
const String _registrationUrl =
    'https://kommunity.com/flutter-turkiye/events/flutter-festivali-81b8ee21?key=dudavx';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final navigationActions = <NavigationAction>[];
  final focusNodes = <FocusNode>[];
  final ScrollController _scrollController = ScrollController();
  bool isScrolling = false;

  @override
  void initState() {
    super.initState();
    _initializeScrollController();
    _initializeNavigationActions();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            /// Using SingleChildScrollView because we want to lay down
            /// all the children to be able to scroll to them.
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: <Widget>[
                  CountdownSection(focusNode: focusNodes[0]),
                  // SpeakerSection(focusNode: focusNodes[1]),
                  EventFlowSection(focusNode: focusNodes[2]),
                  SponsorSection(focusNode: focusNodes[3]),
                  FAQSection(focusNode: focusNodes[4]),
                  FooterSection(focusNode: focusNodes[5]),
                ],
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

  void _initializeNavigationActions() {
    focusNodes.addAll(
      [
        FocusNode(debugLabel: 'Etkinlik'),
        FocusNode(debugLabel: 'Konuşmacılar'),
        FocusNode(debugLabel: 'Program'),
        FocusNode(debugLabel: 'Sponsorlar'),
        FocusNode(debugLabel: 'SSS'),
        FocusNode(debugLabel: 'İletişim'),
        FocusNode(debugLabel: 'Kayıt Ol'),
      ],
    );
    navigationActions.addAll([
      NavigationAction(
        title: 'Etkinlik',
        icon: Icons.celebration,
        focusNode: focusNodes[0],
      ),
      // NavigationAction(
      //   title: 'Konuşmacılar',
      //   icon: Icons.group_rounded,
      //   focusNode: focusNodes[1],
      // ),
      NavigationAction(
        title: 'Etkinlik Programı',
        icon: Icons.event_rounded,
        focusNode: focusNodes[2],
      ),
      NavigationAction(
        title: 'Sponsorlar',
        icon: Icons.help_center_rounded,
        focusNode: focusNodes[3],
      ),
      NavigationAction(
        title: 'SSS',
        icon: Icons.help_center_rounded,
        focusNode: focusNodes[4],
      ),
      NavigationAction(
        title: 'İletişim',
        icon: Icons.phone_in_talk_rounded,
        focusNode: focusNodes[5],
      ),
      NavigationAction(
        title: 'Kayıt Ol',
        icon: Icons.account_circle_rounded,
        focusNode: focusNodes[6],
        onPressed: () async {
          if (await canLaunch(_registrationUrl)) {
            await launch(_registrationUrl);
          }
        },
        isFilled: true,
      ),
    ]);
  }
}
