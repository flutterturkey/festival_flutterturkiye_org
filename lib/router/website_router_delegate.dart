import 'package:festival_flutterturkiye_org/core/model/speaker.dart';
import 'package:festival_flutterturkiye_org/core/ui/speaker_detail_content.dart';
import 'package:festival_flutterturkiye_org/pages/home_page.dart';
import 'package:festival_flutterturkiye_org/pages/unknown_page.dart';
import 'package:festival_flutterturkiye_org/router/website_configuration.dart';
import 'package:flutter/material.dart';

class WebsiteRouterDelegate extends RouterDelegate<WebsiteConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<WebsiteConfiguration> {
  WebsiteRouterDelegate() {
    _homePage = MaterialPage(
      key: const ValueKey<String>('HomePage'),
      child: HomePage(
        selectedSectionNotifier: _selectedSectionNotifier,
        speakerNotifier: _speakerNotifier,
      ),
    );
    Listenable.merge([
      _selectedSectionNotifier,
      _unknownStateNotifier,
      _speakerNotifier,
    ]).addListener(notifyListeners);
  }

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  // App state fields
  final ValueNotifier<Speaker?> _speakerNotifier = ValueNotifier(null);
  final ValueNotifier<String?> _selectedSectionNotifier = ValueNotifier(null);
  final ValueNotifier<bool?> _unknownStateNotifier = ValueNotifier(null);

  late Page _homePage;

  @override
  WebsiteConfiguration get currentConfiguration {
    if (_unknownStateNotifier.value == true) {
      return WebsiteConfiguration.unknown();
    } else {
      return WebsiteConfiguration.home(
        sectionName: _selectedSectionNotifier.value,
        speaker: _speakerNotifier.value,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final speaker = _speakerNotifier.value;
    return Navigator(
      key: navigatorKey,
      pages: _unknownStateNotifier.value == true
          ? [
              const MaterialPage(
                key: ValueKey<String>('Unknown'),
                child: UnknownPage(),
              )
            ]
          : [
              _homePage,
              if (speaker != null)
                SpeakerDialogPage(
                  speaker: speaker,
                  speakerNotifier: _speakerNotifier,
                ),
            ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        if (route.settings.name == SpeakerDialogPage.routeName) {
          _speakerNotifier.value = null;
        }
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(WebsiteConfiguration configuration) async {
    if (configuration.unknown) {
      _unknownStateNotifier.value = true;
      _speakerNotifier.value = null;
    } else {
      _unknownStateNotifier.value = false;
      _selectedSectionNotifier.value = configuration.sectionName;
      _speakerNotifier.value = configuration.speaker;
    }
  }
}

class SpeakerDialogPage extends Page {
  SpeakerDialogPage({
    required this.speaker,
    required this.speakerNotifier,
  }) : super(key: ValueKey('${speaker.hashCode}'));

  static const String routeName = 'SpeakerDialogPage';

  @override
  String get name => routeName;

  final Speaker speaker;
  final ValueNotifier<Speaker?> speakerNotifier;

  @override
  Route createRoute(BuildContext context) => DialogRoute(
        settings: this,
        barrierDismissible: true,
        barrierColor: Colors.black87,
        builder: (context) => SpeakerDetailContent(
          speaker: speaker,
          speakerNotifier: speakerNotifier,
        ),
        context: context,
      );
}
