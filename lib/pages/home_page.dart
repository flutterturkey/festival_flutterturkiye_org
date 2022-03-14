import 'package:festival_flutterturkiye_org/core/model/navigation_action.dart';
import 'package:festival_flutterturkiye_org/core/model/speaker.dart';
import 'package:festival_flutterturkiye_org/core/utils/config.dart';
import 'package:festival_flutterturkiye_org/core/utils/get_it_initializer.dart';
import 'package:festival_flutterturkiye_org/countdown/logic/countdown_repository.dart';
import 'package:festival_flutterturkiye_org/countdown/model/event_status.dart';
import 'package:festival_flutterturkiye_org/countdown/ui/countdown_section.dart';
import 'package:festival_flutterturkiye_org/event_flow/ui/event_flow_section.dart';
import 'package:festival_flutterturkiye_org/faq/ui/faq_section.dart';
import 'package:festival_flutterturkiye_org/footer/ui/footer_section.dart';
import 'package:festival_flutterturkiye_org/navigation/ui/website_navigation.dart';
import 'package:festival_flutterturkiye_org/router/website_route_information_parser.dart';
import 'package:festival_flutterturkiye_org/sponsor/ui/sponsor_section.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _scrollOffset = 12.0;

class HomePage extends StatefulWidget {
  const HomePage({
    required this.speakerNotifier,
    required this.pageTitleNotifier,
    Key? key,
  }) : super(key: key);

  final ValueNotifier<Speaker?> speakerNotifier;
  final ValueNotifier<String> pageTitleNotifier;

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
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) => _jumpToInitialSection(),
    );
  }

  void _jumpToInitialSection() {
    final initialPageName = widget.pageTitleNotifier.value;
    if (availablePathSegmentNames.contains(initialPageName)) {
      final target = availablePathInformationList.firstWhere(
        (element) => element.pathSegmentName == initialPageName,
      );
      _scrollToSection(focusNodes[target.focusNodeIndex]);
    }
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
                  EventFlowSection(
                    focusNode: focusNodes[2],
                    speakerNotifier: widget.speakerNotifier,
                  ),
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
        focusNode: focusNodes[etkinlikPathInformation.focusNodeIndex],
        onPressed: () {
          _scrollToSection(focusNodes[etkinlikPathInformation.focusNodeIndex]);
          widget.pageTitleNotifier.value =
              etkinlikPathInformation.pathSegmentName;
        },
        pathSegmentName: etkinlikPathInformation.pathSegmentName,
      ),
      // NavigationAction(
      //   title: 'Konuşmacılar',
      //   icon: Icons.group_rounded,
      //   focusNode: focusNodes[1],
      // ),
      NavigationAction(
        title: 'Etkinlik Programı',
        icon: Icons.event_rounded,
        focusNode: focusNodes[programPathInformation.focusNodeIndex],
        onPressed: () {
          _scrollToSection(focusNodes[programPathInformation.focusNodeIndex]);
          widget.pageTitleNotifier.value =
              programPathInformation.pathSegmentName;
        },
        pathSegmentName: programPathInformation.pathSegmentName,
      ),
      NavigationAction(
        title: 'Sponsorlar',
        icon: Icons.help_center_rounded,
        focusNode: focusNodes[sponsorPathInformation.focusNodeIndex],
        onPressed: () {
          _scrollToSection(focusNodes[sponsorPathInformation.focusNodeIndex]);
          widget.pageTitleNotifier.value =
              sponsorPathInformation.pathSegmentName;
        },
        pathSegmentName: sponsorPathInformation.pathSegmentName,
      ),
      NavigationAction(
        title: 'SSS',
        icon: Icons.help_center_rounded,
        focusNode: focusNodes[sssPathInformation.focusNodeIndex],
        onPressed: () {
          _scrollToSection(focusNodes[sssPathInformation.focusNodeIndex]);
          widget.pageTitleNotifier.value = sssPathInformation.pathSegmentName;
        },
        pathSegmentName: sssPathInformation.pathSegmentName,
      ),
      NavigationAction(
        title: 'İletişim',
        icon: Icons.phone_in_talk_rounded,
        focusNode: focusNodes[iletisimPathInformation.focusNodeIndex],
        onPressed: () {
          _scrollToSection(focusNodes[iletisimPathInformation.focusNodeIndex]);
          widget.pageTitleNotifier.value =
              iletisimPathInformation.pathSegmentName;
        },
        pathSegmentName: iletisimPathInformation.pathSegmentName,
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

  void _scrollToSection(FocusNode focusNode) {
    final focusContext = focusNode.context;
    if (focusContext != null) {
      Scrollable.ensureVisible(
        focusContext,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
