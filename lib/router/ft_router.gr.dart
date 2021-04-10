// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../event_flow/ui/event_flow_section.dart';
import '../speaker/ui/speaker_section.dart';

class Routes {
  static const String speakerSection = 'speakers';
  static const String eventFlowSection = 'event-flow';
  static const all = <String>{
    speakerSection,
    eventFlowSection,
  };
}

class FTRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.speakerSection, page: SpeakerSection),
    RouteDef(Routes.eventFlowSection, page: EventFlowSection),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SpeakerSection: (data) {
      final args = data.getArgs<SpeakerSectionArguments>(
        orElse: () => SpeakerSectionArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SpeakerSection(key: args.key),
        settings: data,
      );
    },
    EventFlowSection: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const EventFlowSection(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// SpeakerSection arguments holder class
class SpeakerSectionArguments {
  final Key key;
  SpeakerSectionArguments({this.key});
}
