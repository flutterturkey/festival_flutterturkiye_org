import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hackathon_flutterturkiye_org/core/utils/assets.dart';

const _footerBackground = 'assets/images/footer_bg.jpg';

class FooterView extends StatefulWidget {
  FooterView({Key key}) : super(key: key);

  @override
  _FooterViewState createState() => _FooterViewState();
}

class _FooterViewState extends State<FooterView> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        height: MediaQuery.of(context).size.height / 2.3,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_footerBackground),
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

class BottomView extends StatefulWidget {
  @override
  _BottomViewState createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {
  List<Widget> mobileWidgets = [
    Text(
      'Flutter and the related logo are trademarks of Google LLC. Flutter Festival is not affiliated with or otherwise sponsored by Google LLC.',
      style: TextStyle(color: Colors.white),
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

  List<Widget> widgets = [
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
    return Padding(
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
}

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final String link;
  final Color iconColor;

  SocialIcon({
    @required this.icon,
    @required this.link,
    this.iconColor = Colors.white,
  });

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
