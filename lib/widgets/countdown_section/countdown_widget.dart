import 'package:festival_flutterturkiye_org/widgets/countdown_section/countdown_exports.dart';
import 'package:flutter/material.dart';

class CountdownWidget extends StatelessWidget {
  const CountdownWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StreamBuilder<Duration>(
      stream: getCountdown(),
      initialData: _calculateRemainingTime(),
      builder: (context, remainingTimeSnapshot) {
        if (remainingTimeSnapshot.hasData) {
          final textSpans = <TextSpan>[
            _textSpan(
              _dateFixer(remainingTimeSnapshot.data.inDays),
              fontWeight: FontWeight.bold,
            ),
            _textSpan(' gün '),
            _textSpan(
              _dateFixer(remainingTimeSnapshot.data.inHours % 24),
              fontWeight: FontWeight.bold,
            ),
            _textSpan(' saat '),
            _textSpan(
              _dateFixer(remainingTimeSnapshot.data.inMinutes % 60),
              fontWeight: FontWeight.bold,
            ),
            _textSpan(' dakika '),
            _textSpan(
              _dateFixer(remainingTimeSnapshot.data.inSeconds % 60),
              fontWeight: FontWeight.bold,
            ),
            _textSpan(' saniye kaldı'),
          ];
          return CountdownTextBuilder(textSpans: textSpans);
        }
        return const SizedBox.shrink();
      });

  Stream<Duration> getCountdown() async* {
    yield* Stream.periodic(
        const Duration(seconds: 1), (_) => _calculateRemainingTime());
  }

  Duration _calculateRemainingTime() =>
      eventStartingDate.difference(DateTime.now());

  String _dateFixer(int date) => '${date < 10 ? '0' : ''}$date';

  TextSpan _textSpan(String text, {FontWeight fontWeight}) => TextSpan(
        text: text,
        style: fontWeight != null ? TextStyle(fontWeight: fontWeight) : null,
      );
}
