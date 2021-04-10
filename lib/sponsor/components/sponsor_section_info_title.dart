import 'package:flutter/material.dart';

class SponsorSectionInfoTitle extends StatelessWidget {
  const SponsorSectionInfoTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.only(bottom: 25),
        child: Text(
          'Etkinliğimize sponsor olmak için '
          'sponsorluk@flutterturkiye.org üzerinden '
          'iletişime geçebilirsiniz.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
