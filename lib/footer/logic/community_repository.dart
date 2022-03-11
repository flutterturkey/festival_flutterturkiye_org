import 'package:festival_flutterturkiye_org/core/utils/config.dart';
import 'package:festival_flutterturkiye_org/footer/model/social_icon.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CommunityRepository {
  Future<void> sendMail() async {
    if (await canLaunch(_mailAdressLink)) {
      await launch(_mailAdressLink);
    }
  }

  static const List<SocialMedia> socialMedias = [
    SocialMedia(
      icon: MdiIcons.twitter,
      url: FlutterTurkiyeSocialMedias.twitter,
    ),
    SocialMedia(
      icon: Icons.telegram,
      url: FlutterTurkiyeSocialMedias.telegram,
    ),
    SocialMedia(
      icon: MdiIcons.post,
      url: FlutterTurkiyeSocialMedias.medium,
    ),
    SocialMedia(
      icon: MdiIcons.discord,
      url: FlutterTurkiyeSocialMedias.discord,
    ),
    SocialMedia(
      icon: MdiIcons.slack,
      url: FlutterTurkiyeSocialMedias.slack,
    ),
    SocialMedia(
      icon: MdiIcons.github,
      url: FlutterTurkiyeSocialMedias.github,
    ),
    SocialMedia(
      icon: MdiIcons.youtube,
      url: FlutterTurkiyeSocialMedias.youtube,
    ),
  ];

  static const String _mailAdressLink = 'mailto:${Config.supportEmailAddress}';
}
