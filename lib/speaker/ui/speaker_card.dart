import 'package:festival_flutterturkiye_org/core/model/speaker.dart';
import 'package:festival_flutterturkiye_org/core/utils/image_assets.dart';
import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SpeakerCard extends StatelessWidget {
  const SpeakerCard({@required this.speaker, Key key})
      : assert(speaker != null),
        super(key: key);

  final Speaker speaker;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (dialogContext) => AlertDialog(
              backgroundColor: ThemeHelper.darkColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              content: _SpeakerDetailContent(speaker: speaker),
            ),
          );
        },
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Color(0xff212937),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ClipOval(
                    child: Image.asset(
                      ImageAssets.speakerPlaceHolder,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      speaker.name,
                      maxLines: 2,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      speaker.title,
                      maxLines: 2,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
}

class _SpeakerDetailContent extends StatelessWidget {
  const _SpeakerDetailContent({
    @required this.speaker,
    Key key,
  })  : assert(speaker != null),
        super(key: key);
  final Speaker speaker;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                height: 144,
                width: 144,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(speaker.image),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ThemeHelper.eventPointColor,
                    width: 4,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      speaker.name,
                      style: const TextStyle(
                        color: ThemeHelper.lightColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 36,
                      ),
                    ),
                    Text(
                      speaker.title,
                      style: const TextStyle(
                        color: ThemeHelper.lightColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        if (speaker.github != null)
                          Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: _SocialMediaButton(
                                  icon: MdiIcons.github,
                                  url:
                                      'https://www.github.com/${speaker.github}')),
                        if (speaker.linkedin != null)
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: _SocialMediaButton(
                                icon: MdiIcons.linkedin,
                                url:
                                    'https://www.linkedin.com/in/${speaker.linkedin}'),
                          ),
                        if (speaker.twitter != null)
                          Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: _SocialMediaButton(
                                  icon: MdiIcons.twitter,
                                  url:
                                      'https://www.twitter.com/${speaker.twitter}')),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Hakkinda',
            style: TextStyle(
              color: ThemeHelper.lightColor,
              fontWeight: FontWeight.w500,
              fontSize: 28,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            speaker.about,
            style: const TextStyle(
              color: ThemeHelper.lightColor,
              fontSize: 16,
            ),
          ),
        ],
      );
}

class _SocialMediaButton extends StatelessWidget {
  const _SocialMediaButton({
    @required this.icon,
    @required this.url,
    Key key,
  })  : assert(icon != null),
        assert(url != null),
        super(key: key);

  final IconData icon;
  final String url;

  @override
  Widget build(BuildContext context) => ClipOval(
        child: Material(
          elevation: 8,
          shadowColor: Colors.black,
          color: Colors.white10,
          child: InkWell(
            onTap: () async {
              if (await canLaunch(url)) {
                await launch(url);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(
                icon,
                color: ThemeHelper.lightColor,
                size: 24,
              ),
            ),
          ),
        ),
      );
}
