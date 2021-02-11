import 'package:festival_flutterturkiye_org/core/styles/theme_helper.dart';
import 'package:festival_flutterturkiye_org/widgets/sign_in_button.dart';
import 'package:flutter/material.dart';

import 'package:festival_flutterturkiye_org/core/utils/responsive_helper.dart';
import 'package:festival_flutterturkiye_org/widgets/countdown_section/countdown_exports.dart';
import 'package:video_player/video_player.dart';

const double _paddingSmall = 24.0;
const double _paddingMedium = 48.0;
const double _paddingLarge = 72.0;

class CountdownSection extends StatefulWidget {
  @override
  _CountdownSectionState createState() => _CountdownSectionState();
}

class _CountdownSectionState extends State<CountdownSection> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/bg.mp4')
      ..initialize().then(
        (_) {
          _controller.play();
          _controller.setLooping(true);
          setState(() {});
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height,
      width: screenSize.width,
      color: ThemeHelper.cardBackgroundColor,
      child: Stack(
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.fill,
              child: SizedBox(
                width: _controller.value.size?.width ?? 0,
                height: _controller.value.size?.height ?? 0,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          Container(
            height: screenSize.height,
            color: Colors.black.withOpacity(0.75),
          ),
          Container(
            padding: _padding(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _CountdownTitle(),
                SizedBox(height: screenSize.height * 0.1),
                const CountdownWidget(),
                SizedBox(height: screenSize.height * 0.1),
                Container(
                  width: double.infinity,
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Column(
                    children: [
                      // For Countdown Section
                      const SignInButton(
                        fontSize: 28.0,
                        padding: EdgeInsets.symmetric(
                          horizontal: 56.0,
                          vertical: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  EdgeInsets _padding(BuildContext context) {
    if (ResponsiveHelper.isLargeScreen(context)) {
      return EdgeInsets.symmetric(horizontal: _paddingLarge);
    } else if (ResponsiveHelper.isMediumScreen(context)) {
      return EdgeInsets.symmetric(horizontal: _paddingMedium);
    } else {
      return EdgeInsets.symmetric(horizontal: _paddingSmall);
    }
  }
}

class _CountdownTitle extends StatelessWidget {
  const _CountdownTitle();

  @override
  Widget build(BuildContext context) {
    final textSpans = <TextSpan>[
      _textSpan("Türkiye'nin en büyük\n"),
      _textSpan('Flutter Festivali', fontWeight: FontWeight.bold),
      _textSpan(' başlıyor'),
    ];
    return CountdownTextBuilder(textSpans: textSpans);
  }

  TextSpan _textSpan(String text, {FontWeight fontWeight}) {
    assert(text != null);
    return TextSpan(
      text: text,
      style: fontWeight != null ? TextStyle(fontWeight: fontWeight) : null,
    );
  }
}
