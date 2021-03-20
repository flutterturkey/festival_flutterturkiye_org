import 'package:festival_flutterturkiye_org/countdown/logic/countdown_repository.dart';
import 'package:festival_flutterturkiye_org/countdown/model/event_status.dart';
import 'package:festival_flutterturkiye_org/countdown/ui/countdown_text_builder.dart';
import 'package:festival_flutterturkiye_org/countdown/ui/countdown_text_span.dart';
import 'package:flutter/material.dart';

class CountdownCounter extends StatelessWidget {
  CountdownCounter({Key key})
      : _countdownRepository = CountdownRepository(),
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
