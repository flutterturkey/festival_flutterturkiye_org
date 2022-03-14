import 'package:festival_flutterturkiye_org/core/logic/faq_repository.dart';
import 'package:festival_flutterturkiye_org/core/logic/session_repository.dart';
import 'package:festival_flutterturkiye_org/core/logic/speaker_repository.dart';
import 'package:festival_flutterturkiye_org/core/logic/sponsor_repository.dart';
import 'package:festival_flutterturkiye_org/core/utils/get_it_initializer.dart';
import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:festival_flutterturkiye_org/router/website_route_information_parser.dart';
import 'package:festival_flutterturkiye_org/router/website_router_delegate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// ignore: always_use_package_imports
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureApp();
  initializeGetIt();

  await Firebase.initializeApp();
  await getIt.get<SpeakerRepository>().getAllAsModel();
  await getIt.get<SessionRepository>().getAllAsModel();
  await getIt.get<SponsorRepository>().getAllAsModel();
  await getIt.get<FaqRepository>().getAllAsModel();

  runApp(const FlutterFestivalApp());
}

class FlutterFestivalApp extends StatefulWidget {
  const FlutterFestivalApp({Key? key}) : super(key: key);

  @override
  State<FlutterFestivalApp> createState() => _FlutterFestivalAppState();
}

class _FlutterFestivalAppState extends State<FlutterFestivalApp> {
  late WebsiteRouterDelegate delegate;
  late WebsiteRouteInformationParser parser;

  @override
  void initState() {
    super.initState();
    final speakerRepository = getIt.get<SpeakerRepository>();
    final speakers = speakerRepository.speakers;
    delegate = WebsiteRouterDelegate();
    parser = WebsiteRouteInformationParser(speakers: speakers);
  }

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: 'Flutter Festivali',
        theme: ThemeHelper.themeData,
        debugShowCheckedModeBanner: false,
        routerDelegate: delegate,
        routeInformationParser: parser,
      );
}
