import 'package:festival_flutterturkiye_org/core/model/speaker.dart';
import 'package:festival_flutterturkiye_org/router/website_route_information_parser.dart';

class WebsiteConfiguration {
  WebsiteConfiguration.unknown()
      : unknown = true,
        sectionName = unknownPageSegmentName;

  WebsiteConfiguration.home({
    this.sectionName,
    this.speaker,
  }) : unknown = false;

  String? sectionName;
  Speaker? speaker;
  bool unknown;
}
