import 'package:festival_flutterturkiye_org/core/ui/responsive_builder.dart';
import 'package:festival_flutterturkiye_org/core/utils/config.dart';
import 'package:festival_flutterturkiye_org/core/utils/get_it_initializer.dart';
import 'package:festival_flutterturkiye_org/core/utils/image_assets.dart';
import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:festival_flutterturkiye_org/footer/logic/community_repository.dart';
import 'package:festival_flutterturkiye_org/footer/model/social_icon.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({
    required this.focusNode,
    Key? key,
  }) : super(key: key);

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) => Focus(
        focusNode: focusNode,
        child: ResponsiveBuilder(
          largeWidget: _FooterLarge(),
          mediumWidget: _FooterLarge(),
          smallWidget: _FooterSmall(),
        ),
      );
}

class _FooterSmall extends _FooterWidget {
  _FooterSmall({Key? key})
      : super(
          key: key,
          heightRatio: 1.25,
          mailAddressFontSize: 18,
          flutterTurkiyeCopyrightFontSize: 16,
          flutterTurkiyeCopyrightPadding: const EdgeInsets.only(
            top: 12,
            left: 24,
          ),
          isSmallScreen: true,
        );
}

class _FooterLarge extends _FooterWidget {
  _FooterLarge({Key? key})
      : super(
          key: key,
          heightRatio: 2.5,
          mailAddressFontSize: 24,
          flutterTurkiyeCopyrightFontSize: 18,
          flutterTurkiyeCopyrightPadding: const EdgeInsets.only(
            top: 12,
            left: 100,
            right: 100,
          ),
          isSmallScreen: false,
        );
}

class _FooterWidget extends StatelessWidget {
  _FooterWidget({
    required this.heightRatio,
    required this.mailAddressFontSize,
    required this.flutterTurkiyeCopyrightFontSize,
    required this.flutterTurkiyeCopyrightPadding,
    required this.isSmallScreen,
    Key? key,
  })  : _communityRepository = getIt.get<CommunityRepository>(),
        super(key: key);

  final double heightRatio;
  final double mailAddressFontSize;
  final double flutterTurkiyeCopyrightFontSize;
  final EdgeInsets flutterTurkiyeCopyrightPadding;
  final bool isSmallScreen;
  final CommunityRepository _communityRepository;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: const BoxDecoration(color: ThemeHelper.primaryColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              const SizedBox(height: 16),
              // Logo
              Image.asset(ImageAssets.logo),
              // Mail
              const SizedBox(height: 32),
              InkWell(
                onTap: _communityRepository.sendMail,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.mail, color: Colors.white),
                    const SizedBox(width: 12),
                    Flexible(
                      child: Text(
                        Config.supportEmailAddress,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: mailAddressFontSize,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const Divider(
                indent: 100,
                endIndent: 100,
                color: Colors.white,
                thickness: 0.5,
              ),
              Padding(
                padding: flutterTurkiyeCopyrightPadding,
                child: Text(
                  '© ${Config.now.year} Flutter Türkiye',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: flutterTurkiyeCopyrightFontSize,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: _BottomView(isSmallScreen: isSmallScreen),
              ),
            ],
          ),
        ),
      );
}

class _BottomView extends StatelessWidget {
  const _BottomView({required this.isSmallScreen, Key? key}) : super(key: key);

  final bool isSmallScreen;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            children: CommunityRepository.socialMedias
                .map((socialMedia) => _SocialIcon(socialMedia: socialMedia))
                .toList(),
          ),
          const SizedBox(height: 16),
          Text(
            'Flutter and the related logo are trademarks of '
            'Google LLC. Flutter Festival is not affiliated with '
            'or otherwise sponsored by Google LLC.',
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Colors.white,
              fontSize: isSmallScreen ? 12 : 16,
            ),
          ),
        ],
      );
}

class _SocialIcon extends StatelessWidget {
  const _SocialIcon({
    required this.socialMedia,
    this.iconColor = Colors.white,
    Key? key,
  }) : super(key: key);

  final SocialMedia socialMedia;
  final Color iconColor;

  @override
  Widget build(BuildContext context) => IconButton(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        icon: Icon(socialMedia.icon, color: iconColor),
        onPressed: _launchUrl,
      );

  Future<void> _launchUrl() async {
    if (await canLaunch(socialMedia.url)) {
      await launch(socialMedia.url);
    }
  }
}
