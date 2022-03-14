import 'package:collection/collection.dart';
import 'package:festival_flutterturkiye_org/core/model/speaker.dart';
import 'package:festival_flutterturkiye_org/router/website_configuration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const unknownPageSegmentName = '404';

final etkinlikPathInformation = PathInformation(
  pathSegmentName: 'etkinlik',
  focusNodeIndex: 0,
);

final programPathInformation = PathInformation(
  pathSegmentName: 'program',
  focusNodeIndex: 2,
  queryParameter: 'konusmaci',
);

final sponsorPathInformation = PathInformation(
  pathSegmentName: 'sponsorlar',
  focusNodeIndex: 3,
);

final sssPathInformation = PathInformation(
  pathSegmentName: 'sss',
  focusNodeIndex: 4,
);

final iletisimPathInformation = PathInformation(
  pathSegmentName: 'iletisim',
  focusNodeIndex: 5,
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
  etkinlikPathInformation,
  programPathInformation,
  sponsorPathInformation,
  sssPathInformation,
  iletisimPathInformation,
];

List<String> get availablePathSegmentNames => availablePathInformationList
    .map(
      (e) => e.pathSegmentName,
    )
    .toList();

class WebsiteRouteInformationParser extends RouteInformationParser<WebsiteConfiguration> {
  WebsiteRouteInformationParser({required this.speakers});

  final List<Speaker> speakers;

  @override
  Future<WebsiteConfiguration> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.isEmpty) {
      return WebsiteConfiguration.home(pageTitle: '');
    } else if (uri.pathSegments.length == 1) {
      final pathSegment = uri.pathSegments[0];
      if (availablePathSegmentNames.contains(pathSegment)) {
        if (pathSegment == programPathInformation.pathSegmentName && uri.query.isNotEmpty) {
          final targetQueryParam = programPathInformation.queryParameter!;
          final speakerQueryParam = uri.queryParameters[targetQueryParam];
          return WebsiteConfiguration.home(
            pageTitle: pathSegment,
            speaker: speakers.firstWhereOrNull(
              (speaker) => speaker.pathSegmentQueryParam == speakerQueryParam,
            ),
          );
        } else {
          return WebsiteConfiguration.home(pageTitle: pathSegment);
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
        return RouteInformation(location: '/${configuration.pageTitle}');
      } else {
        return RouteInformation(
          location:
              '/program?${programPathInformation.queryParameter!}=${speaker.pathSegmentQueryParam}',
        );
      }
    }
  }
}
