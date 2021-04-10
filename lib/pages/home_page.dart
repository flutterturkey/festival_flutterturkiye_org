import 'package:festival_flutterturkiye_org/core/model/navigation_action.dart';
import 'package:festival_flutterturkiye_org/core/utils/dialog_helper.dart';
import 'package:festival_flutterturkiye_org/countdown/ui/countdown_section.dart';
import 'package:festival_flutterturkiye_org/event_flow/ui/event_flow_section.dart';
import 'package:festival_flutterturkiye_org/footer/ui/footer_section.dart';
import 'package:festival_flutterturkiye_org/navigation/ui/website_navigation.dart';
import 'package:festival_flutterturkiye_org/speaker/ui/speaker_section.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _scrollOffset = 12.0;
const String _registrationUrl =
    'https://kommunity.com/flutter-turkiye/events/flutter-festivali-81b8ee21?key=dudavx';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool isScrolling = false;

  @override
  void initState() {
    super.initState();
    _initializeScrollController();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            ListView(
              controller: _scrollController,
              children: const <Widget>[
                CountdownSection(),
                FooterSection(),
              ],
            ),
            WebsiteNavigation(
              actions: _buildNavigationActions(),
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

  List<NavigationAction> _buildNavigationActions() => <NavigationAction>[
        NavigationAction(
          title: 'Konuşmacılar',
          icon: Icons.group_rounded,
          onPressed: _openSpeakerSection,
        ),
        NavigationAction(
          title: 'Etkinlik Programı',
          icon: Icons.event_rounded,
          onPressed: _openEventFlowSection,
        ),
        NavigationAction(
          title: 'Sponsorlar',
          icon: Icons.help_center_rounded,
          onPressed: _openSponsorSection,
        ),
        NavigationAction(
          title: 'SSS',
          icon: Icons.help_center_rounded,
          onPressed: _openFAQSection,
        ),
        NavigationAction(
          title: 'İletişim',
          icon: Icons.phone_in_talk_rounded,
          onPressed: _openContactSection,
        ),
        NavigationAction(
          title: 'Kayıt Ol',
          icon: Icons.account_circle_rounded,
          onPressed: _openRegistrationWebsite,
          isFilled: true,
        ),
      ];

  void _openSpeakerSection() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SpeakerSection(),
      ),
    );
  }

  void _openEventFlowSection() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const EventFlowSection(),
      ),
    );
  }

  Future<void> _openRegistrationWebsite() async {
    if (await canLaunch(_registrationUrl)) {
      await launch(_registrationUrl);
    }
  }

  void _openSponsorSection() {
    //TODO: UI not ready yet
    DialogHelper.showAvailableSoon(context);
  }

  void _openFAQSection() {
    //TODO: UI not ready yet
    DialogHelper.showAvailableSoon(context);
  }

  void _openContactSection() {
    //TODO: UI not ready yet
    DialogHelper.showAvailableSoon(context);
  }
}
