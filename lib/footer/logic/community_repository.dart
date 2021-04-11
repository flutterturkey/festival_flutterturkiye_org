import 'package:festival_flutterturkiye_org/footer/model/social_icon.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CommunityRepository {
  static const String mailAddress = 'festival@flutterturkiye.org';

  Future<void> sendMail() async {
    if (await canLaunch(_mailAdressLink)) {
      await launch(_mailAdressLink);
    }
  }

  static const List<SocialMedia> socialMedias = [
    SocialMedia(
      icon: MdiIcons.twitter,
      url: 'https://twitter.com/Flutter_Turkiye',
    ),
    SocialMedia(
      icon: MdiIcons.youtube,
      url: 'https://www.youtube.com/c/fluttert%C3%BCrkiye',
    ),
    SocialMedia(
      icon: MdiIcons.telegram,
      url: 'https://t.me/FlutterTR',
    ),
    SocialMedia(
      icon: MdiIcons.discord,
      url: 'https://discord.gg/bkSkTzw',
    ),
    SocialMedia(
      icon: MdiIcons.slack,
      url: 'https://bit.ly/flutterTR',
    ),
    SocialMedia(
      icon: MdiIcons.github,
      url: 'https://github.com/flutterturkey',
    ),
  ];

  static const String _mailAdressLink = 'mailto:$mailAddress';
}
