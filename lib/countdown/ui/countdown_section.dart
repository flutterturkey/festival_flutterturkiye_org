import 'package:festival_flutterturkiye_org/core/ui/generic_button.dart';
import 'package:festival_flutterturkiye_org/core/ui/responsive_builder.dart';
import 'package:festival_flutterturkiye_org/core/utils/assets.dart';
import 'package:festival_flutterturkiye_org/core/utils/config.dart';
import 'package:festival_flutterturkiye_org/core/utils/get_it_initializer.dart';
import 'package:festival_flutterturkiye_org/core/utils/responsive_helper.dart';
import 'package:festival_flutterturkiye_org/core/utils/text_span.dart';
import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:festival_flutterturkiye_org/countdown/logic/countdown_repository.dart';
import 'package:festival_flutterturkiye_org/countdown/model/event_status.dart';
import 'package:festival_flutterturkiye_org/countdown/ui/countdown_text_builder.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

const double _paddingSmall = 24;
const double _paddingMedium = 48;
const double _paddingLarge = 72;

// ignore: todo
// TODO: When the screen height too low, it has a bottom overflowed error.
class CountdownSection extends StatefulWidget {
  const CountdownSection({
    required this.focusNode,
    Key? key,
  }) : super(key: key);

  final FocusNode focusNode;

  @override
  _CountdownSectionState createState() => _CountdownSectionState();
}

class _CountdownSectionState extends State<CountdownSection> {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset('${const VideoAsset('countdown_bg.mp4')}');

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

    return Focus(
      focusNode: widget.focusNode,
      child: Container(
        height: screenSize.height,
        width: screenSize.width,
        color: ThemeHelper.cardBackgroundColor,
        child: Stack(
          children: [
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.fill,
                child: SizedBox(
                  width: _videoPlayerController.value.size.width,
                  height: _videoPlayerController.value.size.height,
                  child: VideoPlayer(_videoPlayerController),
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height,
              width: screenSize.width,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.75),
                ),
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
  Widget build(BuildContext context) => CountdownTextBuilder(
        textSpans: TextSpanUtils.stringToTextSpans(_eventMessage),
      );

  String get _eventMessage {
    switch (_countdownRepository.eventStatus) {
      case EventStatus.waiting:
        return CountdownConfig.waitingEventMessage;
      case EventStatus.started:
        return CountdownConfig.startedEventMessage;
      case EventStatus.completed:
        return CountdownConfig.completedEventMessage;
    }
  }
}

class _CountdownSectionButtons extends StatelessWidget {
  const _CountdownSectionButtons({
    required this.fontSize,
    required this.padding,
    Key? key,
  }) : super(key: key);

  final double fontSize;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) => Wrap(
        runSpacing: 20,
        spacing: 24,
        alignment: WrapAlignment.center,
        children: [
          _LightButton(
            title: 'Birinci Gün',
            fontSize: fontSize,
            padding: padding,
            onPressed: () async {
              const _streamLink = 'https://youtu.be/PjeeFIoJBBI';
              if (await canLaunch(_streamLink)) {
                await launch(_streamLink);
              }
            },
          ),
          _DarkButton(
            title: 'İkinci Gün',
            fontSize: fontSize,
            padding: padding,
            onPressed: () async {
              const _streamLink = 'https://youtu.be/gSvPHOy3ra4';
              if (await canLaunch(_streamLink)) {
                await launch(_streamLink);
              }
            },
          ),
        ],
      );
}

class _LightButton extends StatelessWidget {
  const _LightButton({
    required this.fontSize,
    required this.padding,
    required this.title,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final double fontSize;
  final EdgeInsets padding;
  final String title;
  final void Function() onPressed;

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
    required this.fontSize,
    required this.padding,
    required this.title,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final double fontSize;
  final EdgeInsets padding;
  final String title;
  final void Function() onPressed;

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
  _CountdownCounter({Key? key})
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
          late final List<InlineSpan> textSpans;

          switch (_countdownRepository.eventStatus) {
            case EventStatus.completed:
              textSpans = _completedTextSpan(remainingTime ?? Duration.zero);
              break;
            case EventStatus.started:
              textSpans = _startedTextSpan(remainingTime ?? Duration.zero);
              break;
            case EventStatus.waiting:
              textSpans = _waitingTextSpan(remainingTime ?? Duration.zero);
              break;
          }

          return CountdownTextBuilder(textSpans: textSpans);
        }
        return const SizedBox.shrink();
      });

  String _dateFixer(int date) => '${date < 10 ? '0' : ''}$date';

  List<InlineSpan> _waitingTextSpan(Duration remainingTime) {
    final text = '**${_dateFixer(remainingTime.inDays)}**'
        ' gün '
        '**${_dateFixer(remainingTime.inHours % 24)}**'
        ' saat '
        '**${_dateFixer(remainingTime.inMinutes % 60)}**'
        ' dakika '
        '**${_dateFixer(remainingTime.inSeconds % 60)}**'
        ' saniye '
        'kaldı';

    return TextSpanUtils.stringToTextSpans(text);
  }

  List<InlineSpan> _startedTextSpan(Duration remainingTime) =>
      _waitingTextSpan(remainingTime);

  List<InlineSpan> _completedTextSpan(Duration remainingTime) =>
      TextSpanUtils.stringToTextSpans(
          Config.eventConfig.thankYouForAttendingMessage);
}
