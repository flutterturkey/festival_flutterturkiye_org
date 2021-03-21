import 'package:festival_flutterturkiye_org/core/model/navigation_action.dart';
import 'package:festival_flutterturkiye_org/core/model/speaker.dart';
import 'package:festival_flutterturkiye_org/navigation/ui/website_navigation.dart';
import 'package:festival_flutterturkiye_org/countdown/ui/countdown_section.dart';
import 'package:festival_flutterturkiye_org/speaker/ui/speaker_section.dart';
import 'package:festival_flutterturkiye_org/widgets/event_flow_section/event_flow_section.dart';
import 'package:festival_flutterturkiye_org/widgets/footer_view.dart';
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

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            ListView(
              controller: _scrollController,
              children: <Widget>[
                const CountdownSection(),
                SpeakerSection(
                  speakers: List.generate(
                    9,
                    (index) => const Speaker(
                      name: 'Muhammed Salih Guler',
                      title: 'Useless PoS',
                      image: 'assets/images/speakers/salihgueler.jpg',
                      id: 'id',
                      about:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing '
                              'elit. Morbi interdum justo a mauris pharetra '
                              'finibus. Fusce aliquet tortor mi, vitae feugiat '
                              'arcu fringilla ut. Sed quis massa vulputate, '
                              'dignissim sem a, rutrum dui. In ac nunc dui. '
                              'Morbi scelerisque finibus libero et auctor. '
                              'Aenean lacus mi, placerat eu commodo nec, '
                              'luctus nec arcu. Suspendisse eleifend vehicula '
                              'quam, sed tincidunt lorem consequat luctus. '
                              'In hac habitasse platea dictumst. In malesuada '
                              'luctus ex, volutpat auctor ex placerat eget. '
                              'Aenean egestas tempor lorem a maximus. Ut sed '
                              'risus urna. Sed facilisis lacus at fringilla '
                              'maximus. Nulla id tempus magna. Aenean sit amet'
                              ' t ellus odio. Cras tincidunt felis vitae odio '
                              'elementum semper. ',
                      github: 'salihgueler',
                      linkedin: 'msalihguler',
                      twitter: 'salihgueler',
                    ),
                  ),
                ),
                const EventFlowSection(),
                const FooterView(),
              ],
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
}
