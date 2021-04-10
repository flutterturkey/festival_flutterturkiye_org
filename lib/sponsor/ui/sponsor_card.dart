import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:festival_flutterturkiye_org/core/model/sponsor.dart';
import 'package:festival_flutterturkiye_org/core/utils/image_assets.dart';
import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';

class SponsorCard extends StatelessWidget {
  const SponsorCard({
    @required this.sponsor,
    Key key,
  })  : assert(sponsor != null),
        super(key: key);

  final Sponsor sponsor;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
          elevation: 5,
          shadowColor: ThemeHelper.darkColor.withOpacity(0.5),
          color: sponsor.color,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            onTap: _onTapCard,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Center(
                child: Image.asset(
                  '${ImageAssets.sponsorAssets}${sponsor.logo}',
                ),
              ),
            ),
          ),
        ),
      );

  Future<void> _onTapCard() async {
    if (await canLaunch(sponsor.url)) {
      await launch(sponsor.url);
    }
  }
}
