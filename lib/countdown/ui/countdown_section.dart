import 'package:festival_flutterturkiye_org/core/utils/get_it_initializer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import 'package:festival_flutterturkiye_org/core/ui/generic_button.dart';
import 'package:festival_flutterturkiye_org/core/utils/responsive_helper.dart';
import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:festival_flutterturkiye_org/countdown/logic/countdown_repository.dart';
import 'package:festival_flutterturkiye_org/countdown/model/event_status.dart';
import 'package:festival_flutterturkiye_org/countdown/ui/countdown_text_builder.dart';
import 'package:festival_flutterturkiye_org/countdown/ui/countdown_text_span.dart';
import 'package:festival_flutterturkiye_org/core/ui/responsive_builder.dart';

const double _paddingSmall = 24;
const double _paddingMedium = 48;
const double _paddingLarge = 72;
const String _registrationUrl =
    'https://kommunity.com/flutter-turkiye/events/flutter-festivali-81b8ee21?key=dudavx';
const String _hackathonUrl = 'https://bit.ly/flutter-festivali-hackathon';
// const String _callForPapersUrl =
//     'https://sessionize.com/flutter-festival-turkiye';

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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: kToolbarHeight),
                _CountdownTitle(),
                _CountdownCounter(),
                const Flexible(
                  child: ResponsiveBuilder(
                    smallWidget: _CountdownSectionButtons(
                      fontSize: 32,
                      padding: EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 16,
                      ),
                    ),
                    mediumWidget: _CountdownSectionButtons(
                      fontSize: 40,
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 32,
                      ),
                    ),
                    largeWidget: _CountdownSectionButtons(
                      fontSize: 48,
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 64,
                      ),
                    ),
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
  _CountdownTitle() : _countdownRepository = getIt.get<CountdownRepository>();

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

class _CountdownSectionButtons extends StatelessWidget {
  const _CountdownSectionButtons({
    @required this.fontSize,
    @required this.padding,
    Key key,
  })  : assert(fontSize != null),
        assert(padding != null),
        super(key: key);

  final double fontSize;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) => Wrap(
        runSpacing: 20,
        spacing: 24,
        alignment: WrapAlignment.center,
        children: [
          _LightButton(
            title: 'Kayıt Ol',
            fontSize: fontSize,
            padding: padding,
            onPressed: () async {
              if (await canLaunch(_registrationUrl)) {
                await launch(_registrationUrl);
              }
            },
          ),
          _DarkButton(
            title: 'Hackathon Başvurusu',
            fontSize: fontSize,
            padding: padding,
            onPressed: () async {
              if (await canLaunch(_hackathonUrl)) {
                await launch(_hackathonUrl);
              }
            },
          ),
        ],
      );
}

class _LightButton extends StatelessWidget {
  const _LightButton({
    @required this.fontSize,
    @required this.padding,
    @required this.title,
    @required this.onPressed,
    Key key,
  })  : assert(fontSize != null),
        assert(padding != null),
        assert(title != null),
        assert(onPressed != null),
        super(key: key);

  final double fontSize;
  final EdgeInsets padding;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) => GenericButton(
        title: title,
        onPressed: onPressed,
        isFilledButton: true,
        textStyle: TextStyle(fontSize: fontSize),
        textPadding: padding,
      );
}

class _DarkButton extends StatelessWidget {
  const _DarkButton({
    @required this.fontSize,
    @required this.padding,
    @required this.title,
    @required this.onPressed,
    Key key,
  })  : assert(fontSize != null),
        assert(padding != null),
        assert(title != null),
        assert(onPressed != null),
        super(key: key);

  final double fontSize;
  final EdgeInsets padding;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) => GenericButton(
        title: title,
        onPressed: onPressed,
        isFilledButton: true,
        textStyle: TextStyle(
          fontSize: fontSize,
          color: ThemeHelper.appBarActionColor,
        ),
        textPadding: padding,
        buttonStyle: TextButton.styleFrom(
          backgroundColor: ThemeHelper.darkColor,
        ),
      );
}

class _CountdownCounter extends StatelessWidget {
  _CountdownCounter({Key key})
      : _countdownRepository = getIt.get<CountdownRepository>(),
        super(key: key);

  final CountdownRepository _countdownRepository;

  @override
  Widget build(BuildContext context) => StreamBuilder<Duration>(
      stream: _countdownRepository.getCountdown(),
      initialData: _countdownRepository.countdownInitialData,
      builder: (context, remainingTimeSnapshot) {
        if (remainingTimeSnapshot.hasData) {
          final remainingTime = remainingTimeSnapshot.data;
          var textSpans = <TextSpan>[];

          switch (_countdownRepository.eventStatus) {
            case EventStatus.completed:
              textSpans = _completedTextSpan(remainingTime);
              break;
            case EventStatus.started:
              textSpans = _startedTextSpan(remainingTime);
              break;
            case EventStatus.waiting:
              textSpans = _waitingTextSpan(remainingTime);
              break;
          }

          return CountdownTextBuilder(textSpans: textSpans);
        }
        return const SizedBox.shrink();
      });

  String _dateFixer(int date) => '${date < 10 ? '0' : ''}$date';

  List<TextSpan> _waitingTextSpan(Duration remainingTime) => <TextSpan>[
        _DateText(_dateFixer(remainingTime.inDays)),
        CountdownTextSpan(' gün '),
        _DateText(_dateFixer(remainingTime.inHours % 24)),
        CountdownTextSpan(' saat '),
        _DateText(_dateFixer(remainingTime.inMinutes % 60)),
        CountdownTextSpan(' dakika '),
        _DateText(_dateFixer(remainingTime.inSeconds % 60)),
        CountdownTextSpan(' saniye kaldı'),
      ];

  List<TextSpan> _startedTextSpan(Duration remainingTime) => <TextSpan>[
        _DateText(_dateFixer(remainingTime.inDays)),
        CountdownTextSpan(' gün '),
        _DateText(_dateFixer(remainingTime.inHours % 24)),
        CountdownTextSpan(' saat '),
        _DateText(_dateFixer(remainingTime.inMinutes % 60)),
        CountdownTextSpan(' dakika '),
        _DateText(_dateFixer(remainingTime.inSeconds % 60)),
        CountdownTextSpan(' saniye kaldı'),
      ];

  List<TextSpan> _completedTextSpan(Duration remainingTime) => <TextSpan>[
        CountdownTextSpan(
          'Etkinliğimize göstermiş olduğunuz ilgi için\n',
        ),
        CountdownTextSpan(
          'TEŞEKKÜR EDERİZ',
          fontWeight: FontWeight.bold,
        )
      ];
}

/// The only difference with [CountdownTextSpan] is [FontWeight]
///
/// Default [FontWeight] is `FontWeight.bold`
class _DateText extends CountdownTextSpan {
  /// If you give a [fontWeight], it will override the default [FontWeight].
  _DateText(String text, {FontWeight fontWeight = FontWeight.bold})
      : assert(text != null),
        assert(fontWeight != null),
        super(text, fontWeight: fontWeight);
}
