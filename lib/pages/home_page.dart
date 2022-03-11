import 'package:festival_flutterturkiye_org/core/model/navigation_action.dart';
import 'package:festival_flutterturkiye_org/core/utils/config.dart';
import 'package:festival_flutterturkiye_org/core/utils/get_it_initializer.dart';
import 'package:festival_flutterturkiye_org/countdown/logic/countdown_repository.dart';
import 'package:festival_flutterturkiye_org/countdown/model/event_status.dart';
import 'package:festival_flutterturkiye_org/countdown/ui/countdown_section.dart';
import 'package:festival_flutterturkiye_org/event_flow/ui/event_flow_section.dart';
import 'package:festival_flutterturkiye_org/faq/ui/faq_section.dart';
import 'package:festival_flutterturkiye_org/footer/ui/footer_section.dart';
import 'package:festival_flutterturkiye_org/navigation/ui/website_navigation.dart';
import 'package:festival_flutterturkiye_org/sponsor/ui/sponsor_section.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _scrollOffset = 12.0;

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final navigationActions = <NavigationAction>[];
  final focusNodes = <FocusNode>[];
  final ScrollController _scrollController = ScrollController();
  bool isScrolling = false;
  final EventStatus eventStatus = getIt.get<CountdownRepository>().eventStatus;

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
        ...eventStatus == EventStatus.waiting
            ? [
                FocusNode(debugLabel: 'Konuşmacı Ol'),
                FocusNode(debugLabel: 'Kayıt Ol'),
              ]
            : [
                FocusNode(debugLabel: 'Birinci Gün'),
                FocusNode(debugLabel: 'İkinci Gün'),
              ],
      ],
    );
    navigationActions.addAll([
      NavigationAction(
        title: 'Etkinlik',
        icon: Icons.celebration,
        focusNode: focusNodes[0],
        onPressed: () {},
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
        onPressed: () {},
      ),
      NavigationAction(
        title: 'Sponsorlar',
        icon: Icons.help_center_rounded,
        focusNode: focusNodes[3],
        onPressed: () {},
      ),
      NavigationAction(
        title: 'SSS',
        icon: Icons.help_center_rounded,
        focusNode: focusNodes[4],
        onPressed: () {},
      ),
      NavigationAction(
        title: 'İletişim',
        icon: Icons.phone_in_talk_rounded,
        focusNode: focusNodes[5],
        onPressed: () {},
      ),
      ...eventStatus == EventStatus.waiting
          ? [
              NavigationAction(
                title: 'Konuşmacı Ol',
                icon: Icons.account_circle_rounded,
                focusNode: focusNodes[6],
                onPressed: () async {
                  const url = Config.callForPapersUrl;
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                },
                isFilled: true,
              ),
              NavigationAction(
                title: 'Kayıt Ol',
                icon: Icons.people,
                focusNode: focusNodes[7],
                onPressed: () async {
                  const url = Config.attendeeRegistrationUrl;
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                },
                isFilled: true,
              ),
            ]
          : [
              NavigationAction(
                title: 'Birinci Gün',
                icon: Icons.calendar_month,
                focusNode: focusNodes[6],
                onPressed: () async {
                  const url = Config.firstDayStreamUrl;
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                },
                isFilled: true,
              ),
              NavigationAction(
                title: 'İkinci Gün',
                icon: Icons.calendar_month,
                focusNode: focusNodes[7],
                onPressed: () async {
                  const url = Config.secondDayStreamUrl;
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                },
                isFilled: true,
              ),
            ],
    ]);
  }
}
