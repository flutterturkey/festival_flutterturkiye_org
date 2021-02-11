import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:festival_flutterturkiye_org/utils/assets.dart';
import 'package:festival_flutterturkiye_org/widgets/responsive_builder.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      largeWidget: LargeWidget(),
      mediumWidget: MediumWidget(),
      smallWidget: SmallWidget(),
    );
  }
}

class SmallWidget extends StatelessWidget {
  const SmallWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          height: MediaQuery.of(context).size.height / 1.25,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.footerBackground),
                    fit: BoxFit.cover,
                  ),
                ),
              ), // background
              Container(
                color: Colors.black.withOpacity(0.75),
              ), // black filter
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 40.0,
                      ),
                      child: Image.asset(
                        Assets.logo,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      child: InkWell(
                        onTap: () =>
                            launch('mailto:hackathon@flutterturkiye.org'),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.mail,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'hackathon@flutterturkiye.org',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      indent: 100,
                      endIndent: 100,
                      color: Colors.white,
                      thickness: 0.5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 24,
                        ),
                        child: Text(
                          '© 2021 Flutter Türkiye',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    BottomView(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class MediumWidget extends StatelessWidget {
  const MediumWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.footerBackground),
                    fit: BoxFit.cover,
                  ),
                ),
              ), // background
              Container(
                color: Colors.black.withOpacity(0.75),
              ), // black filter
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 40.0,
                      ),
                      child: Image.asset(
                        Assets.logo,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      child: InkWell(
                        onTap: () =>
                            launch('mailto:hackathon@flutterturkiye.org'),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.mail,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
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
                    Divider(
                      indent: 100,
                      endIndent: 100,
                      color: Colors.white,
                      thickness: 0.5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 100,
                          right: 100,
                        ),
                        child: Text(
                          '© 2021 Flutter Türkiye',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    BottomView(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class LargeWidget extends StatelessWidget {
  const LargeWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        height: MediaQuery.of(context).size.height / 2.5,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.footerBackground),
                  fit: BoxFit.cover,
                ),
              ),
            ), // background
            Container(
              color: Colors.black.withOpacity(0.75),
            ), // black filter
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 40.0,
                    ),
                    child: Image.asset(
                      Assets.logo,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 10),
                    child: InkWell(
                      onTap: () =>
                          launch('mailto:hackathon@flutterturkiye.org'),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.mail,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
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
                  Divider(
                    indent: 100,
                    endIndent: 100,
                    color: Colors.white,
                    thickness: 0.5,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 100,
                        right: 100,
                      ),
                      child: Text(
                        '© 2021 Flutter Türkiye',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  BottomView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomView extends StatelessWidget {
  BottomView({Key key}) : super(key: key);

  final List<Widget> mobileWidgets = [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        'Flutter and the related logo are trademarks of Google LLC. Flutter Festival is not affiliated with or otherwise sponsored by Google LLC.',
        textAlign: TextAlign.justify,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    ),
    SocialIcon(
      icon: MdiIcons.twitter,
      link: 'https://twitter.com/Flutter_Turkiye',
    ),
    SocialIcon(
      icon: MdiIcons.youtube,
      link: 'https://www.youtube.com/c/fluttert%C3%BCrkiye',
    ),
    SocialIcon(
      icon: MdiIcons.telegram,
      link: 'https://t.me/FlutterTR',
    ),
    SocialIcon(
      icon: MdiIcons.discord,
      link: 'https://discord.gg/bkSkTzw',
    )
  ];

  final List<Widget> widgets = [
    Expanded(
      child: Text(
        'Flutter and the related logo are trademarks of Google LLC. Flutter Hackathon is not affiliated with or otherwise sponsored by Google LLC.',
        style: TextStyle(color: Colors.white),
      ),
    ),
    SocialIcon(
      icon: MdiIcons.twitter,
      link: 'https://twitter.com/Flutter_Turkiye',
    ),
    SocialIcon(
      icon: MdiIcons.youtube,
      link: 'https://www.youtube.com/c/fluttert%C3%BCrkiye',
    ),
    SocialIcon(
      icon: MdiIcons.telegram,
      link: 'https://t.me/FlutterTR',
    ),
    SocialIcon(
      icon: MdiIcons.discord,
      link: 'https://discord.gg/bkSkTzw',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      largeWidget: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 100,
            right: 100,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: widgets,
          )),
      smallWidget: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 10,
          ),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: mobileWidgets,
          )),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final String link;
  final Color iconColor;

  SocialIcon({
    @required this.icon,
    @required this.link,
    this.iconColor = Colors.white,
  })  : assert(icon != null),
        assert(link != null),
        assert(iconColor != null);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      icon: Icon(
        icon,
        color: iconColor,
      ),
      onPressed: () => launch(link),
    );
  }
}
