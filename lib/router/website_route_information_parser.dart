import 'package:collection/collection.dart';
import 'package:festival_flutterturkiye_org/core/model/speaker.dart';
import 'package:festival_flutterturkiye_org/router/website_configuration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const unknownPageSegmentName = '404';

final eventPathInformation = PathInformation(
  pathSegmentName: 'event',
  focusNodeIndex: 0,
);

final programPathInformation = PathInformation(
  pathSegmentName: 'program',
  focusNodeIndex: 1,
  queryParameter: 'speaker',
);

final sponsorPathInformation = PathInformation(
  pathSegmentName: 'sponsors',
  focusNodeIndex: 2,
);

final faqPathInformation = PathInformation(
  pathSegmentName: 'faq',
  focusNodeIndex: 3,
);

final contactUsPathInformation = PathInformation(
  pathSegmentName: 'contact-us',
  focusNodeIndex: 4,
);

class PathInformation {
  PathInformation({
    required this.pathSegmentName,
    required this.focusNodeIndex,
    this.queryParameter,
  });

  final String pathSegmentName;
  final int focusNodeIndex;
  final String? queryParameter;
}

List<PathInformation> availablePathInformationList = [
  eventPathInformation,
  programPathInformation,
  sponsorPathInformation,
  faqPathInformation,
  contactUsPathInformation,
];

List<String> get availablePathSegmentNames =>
    availablePathInformationList.map((e) => e.pathSegmentName).toList();

class WebsiteRouteInformationParser
    extends RouteInformationParser<WebsiteConfiguration> {
  WebsiteRouteInformationParser({required this.speakers});

  final List<Speaker> speakers;

  @override
  Future<WebsiteConfiguration> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final uri = Uri.tryParse(routeInformation.location!);
    if (uri == null) {
      return WebsiteConfiguration.home(sectionName: '');
    } else if (uri.pathSegments.isEmpty) {
      return WebsiteConfiguration.home(sectionName: '');
    } else if (uri.pathSegments.length == 1) {
      final pathSegment = uri.pathSegments[0];
      if (availablePathSegmentNames.contains(pathSegment)) {
        if (pathSegment == programPathInformation.pathSegmentName &&
            uri.query.isNotEmpty) {
          final targetQueryParam = programPathInformation.queryParameter!;
          final speakerQueryParam = uri.queryParameters[targetQueryParam];
          return WebsiteConfiguration.home(
            sectionName: pathSegment,
            speaker: speakers.firstWhereOrNull(
              (speaker) => speaker.pathSegmentQueryParam == speakerQueryParam,
            ),
          );
        } else {
          return WebsiteConfiguration.home(sectionName: pathSegment);
        }
      }
    }
    return WebsiteConfiguration.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(WebsiteConfiguration configuration) {
    if (configuration.unknown) {
      return const RouteInformation(location: '/$unknownPageSegmentName');
    } else {
      final speaker = configuration.speaker;
      if (speaker == null) {
        return RouteInformation(location: '/${configuration.sectionName}');
      } else {
        return RouteInformation(
          location:
              '/program?${programPathInformation.queryParameter!}=${speaker.pathSegmentQueryParam}',
        );
      }
    }
  }
}
