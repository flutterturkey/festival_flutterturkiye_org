import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:festival_flutterturkiye_org/core/utils/responsive_helper.dart';
import 'package:festival_flutterturkiye_org/widgets/speaker_detail/speaker_detail.dart';
import 'package:flutter/material.dart';

class SpeakerDetailPage extends StatelessWidget {
  SpeakerDetailPage({Key key}) : super(key: key);

  final String speakerImage = 'assets/images/speakers/salihgueler.jpg';
  final String speakerName = 'Salih Güler';
  final String speakerCompany =
      'Senior Software Engineer (Flutter) at Superlist';
  final String speakerTwitter = 'salihgueler';
  final String speakerGithub = 'salihgueler';
  final String speakerLinkedIn = 'msalihguler';
  final String speakerAbout = "Superlist'te SSE olarak çalışan Salih, "
      'Flutter ile ilgili bütün etkinliklerde konuşmacı oluyor...';

  final String sessionName = "Superlist'te nasıl uygulama geliştiriyoruz?";
  final DateTime sessionStartingDate = DateTime(2021, 03, 06, 10);
  final DateTime sessionDueDate = DateTime(2021, 03, 06, 10, 30);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ThemeHelper.darkColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: _padding(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpeakerDetailHeader(
                  speakerImage: speakerImage,
                  speakerName: speakerName,
                  speakerCompany: speakerCompany,
                  speakerTwitter: speakerTwitter,
                  speakerGithub: speakerGithub,
                  speakerLinkedIn: speakerLinkedIn,
                ),
                const SizedBox(height: 36),
                _SpeakerAbout(about: speakerAbout),
                const SizedBox(height: 36),
                SessionAbout(
                  name: sessionName,
                  startingDate: sessionStartingDate,
                  dueDate: sessionDueDate,
                ),
              ],
            ),
          ),
        ),
      );

  EdgeInsets _padding(BuildContext context) {
    if (ResponsiveHelper.isLargeScreen(context)) {
      return const EdgeInsets.all(72);
    } else if (ResponsiveHelper.isLargeScreen(context)) {
      return const EdgeInsets.all(48);
    } else {
      return const EdgeInsets.all(24);
    }
  }
}

class _SpeakerAbout extends StatelessWidget {
  const _SpeakerAbout({
    @required this.about,
    Key key,
  })  : assert(about != null),
        super(key: key);

  final String about;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SpeakerDetailSubTitle(title: 'Hakkında'),
          SpeakerDetailSubText(text: about),
        ],
      );
}
