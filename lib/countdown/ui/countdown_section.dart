import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:festival_flutterturkiye_org/core/ui/generic_button.dart';
import 'package:festival_flutterturkiye_org/core/utils/responsive_helper.dart';
import 'package:festival_flutterturkiye_org/countdown/countdown_repository.dart';
import 'package:festival_flutterturkiye_org/countdown/model/event_status.dart';
import 'package:festival_flutterturkiye_org/countdown/ui/countdown_text_builder.dart';
import 'package:festival_flutterturkiye_org/countdown/ui/countdown_text_span.dart';
import 'package:festival_flutterturkiye_org/countdown/ui/countdown_counter.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

const double _paddingSmall = 24;
const double _paddingMedium = 48;
const double _paddingLarge = 72;

// TODO: When the screen height too low, it has a bottom overflowed error.
class CountdownSection extends StatefulWidget {
  const CountdownSection({Key key}) : super(key: key);

  @override
  _CountdownSectionState createState() => _CountdownSectionState();
}

class _CountdownSectionState extends State<CountdownSection> {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset('assets/videos/countdown_bg.mp4');

  @override
  void initState() {
    super.initState();
    _videoPlayerController.initialize().then(
      (_) {
        _videoPlayerController
          ..setVolume(0)
          ..play()
          ..setLooping(true);
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
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
                width: _videoPlayerController.value.size?.width ?? 0,
                height: _videoPlayerController.value.size?.height ?? 0,
                child: VideoPlayer(_videoPlayerController),
              ),
            ),
          ),
          SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.75)),
            ),
          ),
          Padding(
            padding: _padding(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _CountdownTitle(),
                SizedBox(height: screenSize.height * 0.1),
                CountdownCounter(),
                SizedBox(height: screenSize.height * 0.1),
                Container(
                  width: double.infinity,
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Column(
                    children: [
                      // For Countdown Section
                      GenericButton(
                        title: 'Kayıt Ol',
                        onPressed: () {
                          // TODO: Open the browser for the form or Kommunity
                          debugPrint(
                            'Open the browser for the form or Kommunity',
                          );
                        },
                        isFilledButton: true,
                        textStyle: const TextStyle(fontSize: 36),
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 24,
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
      return const EdgeInsets.symmetric(horizontal: _paddingLarge);
    } else if (ResponsiveHelper.isMediumScreen(context)) {
      return const EdgeInsets.symmetric(horizontal: _paddingMedium);
    } else {
      return const EdgeInsets.symmetric(horizontal: _paddingSmall);
    }
  }
}

class _CountdownTitle extends StatelessWidget {
  _CountdownTitle() : _countdownRepository = CountdownRepository();

  final CountdownRepository _countdownRepository;

  @override
  Widget build(BuildContext context) {
    final textSpans = <TextSpan>[
      CountdownTextSpan("Türkiye'nin en büyük\n"),
      CountdownTextSpan('Flutter Festivali ', fontWeight: FontWeight.bold),
    ];

    switch (_countdownRepository.eventStatus) {
      case EventStatus.completed:
        textSpans.add(CountdownTextSpan('bitti!'));
        break;
      case EventStatus.started:
        textSpans.add(CountdownTextSpan('başladı!'));
        break;
      case EventStatus.waiting:
        textSpans.add(CountdownTextSpan('başlıyor!'));
        break;
    }

    return CountdownTextBuilder(textSpans: textSpans);
  }
}
