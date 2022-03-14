import 'package:festival_flutterturkiye_org/core/model/speaker.dart';
import 'package:festival_flutterturkiye_org/router/website_route_information_parser.dart';

class WebsiteConfiguration {
  WebsiteConfiguration.unknown()
      : unknown = true,
        pageTitle = unknownPageSegmentName;

  WebsiteConfiguration.home({
    required this.pageTitle,
    this.speaker,
  }) : unknown = false;

  String pageTitle;
  Speaker? speaker;
  bool unknown;
}
