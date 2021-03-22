import 'package:festival_flutterturkiye_org/core/utils/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterView extends StatefulWidget {
  const FooterView({Key key}) : super(key: key);

  @override
  _FooterViewState createState() => _FooterViewState();
}

class _FooterViewState extends State<FooterView> {
  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 2.3,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageAssets.footerBackground),
                    fit: BoxFit.cover,
                  ),
                ),
              ), // background
              Container(
                color: Colors.black.withOpacity(0.75),
              ), // black filter
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 40,
                      ),
                      child: Image.asset(
                        ImageAssets.logo,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      child: InkWell(
                        onTap: () =>
                            launch('mailto:hackathon@flutterturkiye.org'),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.mail,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'hackathon@flutterturkiye.org',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      indent: 100,
                      endIndent: 100,
                      color: Colors.white,
                      thickness: 0.5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: MediaQuery.of(context).size.width > 1200
                            ? const EdgeInsets.only(
                                top: 10,
                                left: 100,
                                right: 100,
                              )
                            : const EdgeInsets.only(
                                top: 10,
                                left: 10,
                              ),
                        child: const Text(
                          '© 2021 Flutter Türkiye',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const BottomView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

class BottomView extends StatefulWidget {
  const BottomView({Key key}) : super(key: key);

  @override
  _BottomViewState createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {
  List<Widget> mobileWidgets = [
    const Text(
      'Flutter and the related logo are trademarks of Google LLC. '
      'Flutter Festival '
      'is not affiliated with or otherwise sponsored by Google LLC.',
      style: TextStyle(color: Colors.white),
    ),
    const SocialIcon(
      icon: MdiIcons.twitter,
      link: 'https://twitter.com/Flutter_Turkiye',
    ),
    const SocialIcon(
      icon: MdiIcons.youtube,
      link: 'https://www.youtube.com/c/fluttert%C3%BCrkiye',
    ),
    const SocialIcon(
      icon: MdiIcons.telegram,
      link: 'https://t.me/FlutterTR',
    ),
    const SocialIcon(
      icon: MdiIcons.discord,
      link: 'https://discord.gg/bkSkTzw',
    )
  ];

  List<Widget> widgets = [
    const Expanded(
      child: Text(
        'Flutter and the related logo are trademarks of Google LLC. '
        'Flutter Festival is not affiliated with or '
        'otherwise sponsored by Google LLC.',
        style: TextStyle(color: Colors.white),
      ),
    ),
    const SocialIcon(
      icon: MdiIcons.twitter,
      link: 'https://twitter.com/Flutter_Turkiye',
    ),
    const SocialIcon(
      icon: MdiIcons.youtube,
      link: 'https://www.youtube.com/c/fluttert%C3%BCrkiye',
    ),
    const SocialIcon(
      icon: MdiIcons.telegram,
      link: 'https://t.me/FlutterTR',
    ),
    const SocialIcon(
      icon: MdiIcons.discord,
      link: 'https://discord.gg/bkSkTzw',
    )
  ];

  @override
  Widget build(BuildContext context) => Padding(
      padding: MediaQuery.of(context).size.width > 1200
          ? const EdgeInsets.only(
              top: 10,
              left: 100,
              right: 100,
            )
          : const EdgeInsets.only(
              top: 10,
              left: 10,
            ),
      child: MediaQuery.of(context).size.width > 1200
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: widgets,
            )
          : Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 20,
              children: mobileWidgets,
            ));
}

class SocialIcon extends StatelessWidget {
  const SocialIcon({
    @required this.icon,
    @required this.link,
    this.iconColor = Colors.white,
    Key key,
  })  : assert(icon != null),
        assert(link != null),
        assert(iconColor != null),
        super(key: key);

  final IconData icon;
  final String link;
  final Color iconColor;

  @override
  Widget build(BuildContext context) => IconButton(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        icon: Icon(
          icon,
          color: iconColor,
        ),
        onPressed: () => launch(link),
      );
}
