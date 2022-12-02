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
    required this.selectedSectionNotifier,
    Key? key,
  }) : super(key: key);

  final ValueNotifier<Speaker?> speakerNotifier;
  final ValueNotifier<String?> selectedSectionNotifier;

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
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _jumpToInitialSection(),
    );
  }

  void _jumpToInitialSection() {
    final initialSectionName = widget.selectedSectionNotifier.value;
    if (initialSectionName != null &&
        availablePathSegmentNames.contains(initialSectionName)) {
      final target = _findTargetPathInformation(initialSectionName);
      _scrollToSection(focusNodes[target.focusNodeIndex]);
    }
  }

  PathInformation _findTargetPathInformation(String pathName) =>
      availablePathInformationList.firstWhere(
        (element) => element.pathSegmentName == pathName,
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            /// Using SingleChildScrollView because we want to lay down
            /// all the children to be able to scroll to them.
            NotificationListener(
              onNotification: (notification) {
                if (notification is UserScrollNotification) {
                  _onUserScrolled(notification.metrics.pixels);
                }
                return true;
              },
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: <Widget>[
                    CountdownSection(
                        focusNode:
                            focusNodes[eventPathInformation.focusNodeIndex]),
                    // SpeakerSection(focusNode: focusNodes[1]),
                    EventFlowSection(
                      focusNode:
                          focusNodes[programPathInformation.focusNodeIndex],
                      speakerNotifier: widget.speakerNotifier,
                    ),
                    SponsorSection(
                        focusNode:
                            focusNodes[sponsorPathInformation.focusNodeIndex]),
                    FAQSection(
                        focusNode:
                            focusNodes[faqPathInformation.focusNodeIndex]),
                    FooterSection(
                        focusNode: focusNodes[
                            contactUsPathInformation.focusNodeIndex]),
                  ],
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

  void _onUserScrolled(double offset) {
    var totalItemHeight = 0.0;
    for (var i = 0; i < focusNodes.length; i++) {
      totalItemHeight += focusNodes[i].context!.size!.height;
      if (totalItemHeight > offset) {
        final name = availablePathInformationList
            .firstWhere((element) => element.focusNodeIndex == i)
            .pathSegmentName;
        widget.selectedSectionNotifier.value = name;
        break;
      }
    }
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
        focusNode: focusNodes[eventPathInformation.focusNodeIndex],
        onPressed: () {
          _scrollToSection(focusNodes[eventPathInformation.focusNodeIndex]);
          widget.selectedSectionNotifier.value =
              eventPathInformation.pathSegmentName;
        },
        pathSegmentName: eventPathInformation.pathSegmentName,
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
          widget.selectedSectionNotifier.value =
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
          widget.selectedSectionNotifier.value =
              sponsorPathInformation.pathSegmentName;
        },
        pathSegmentName: sponsorPathInformation.pathSegmentName,
      ),
      NavigationAction(
        title: 'SSS',
        icon: Icons.help_center_rounded,
        focusNode: focusNodes[faqPathInformation.focusNodeIndex],
        onPressed: () {
          _scrollToSection(focusNodes[faqPathInformation.focusNodeIndex]);
          widget.selectedSectionNotifier.value =
              faqPathInformation.pathSegmentName;
        },
        pathSegmentName: faqPathInformation.pathSegmentName,
      ),
      NavigationAction(
        title: 'İletişim',
        icon: Icons.phone_in_talk_rounded,
        focusNode: focusNodes[contactUsPathInformation.focusNodeIndex],
        onPressed: () {
          _scrollToSection(focusNodes[contactUsPathInformation.focusNodeIndex]);
          widget.selectedSectionNotifier.value =
              contactUsPathInformation.pathSegmentName;
        },
        pathSegmentName: contactUsPathInformation.pathSegmentName,
      ),
      if (eventStatus == EventStatus.waiting)
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
