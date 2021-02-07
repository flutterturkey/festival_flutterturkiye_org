import 'package:flutter/material.dart';
import 'package:hackathon_flutterturkiye_org/widgets/speaker_detail/speaker_detail.dart';
import 'package:hackathon_flutterturkiye_org/core/styles/theme_helper.dart';
import 'package:hackathon_flutterturkiye_org/core/utils/responsive_helper.dart';

class SpeakerDetailPage extends StatelessWidget {
  SpeakerDetailPage({Key key}) : super(key: key);

  final String speakerImage = 'assets/images/speakers/salihgueler.jpg';
  final String speakerName = 'Salih Güler';
  final String speakerCompany =
      'Senior Software Engineer (Flutter) at Superlist';
  final String speakerTwitter = 'salihgueler';
  final String speakerGithub = 'salihgueler';
  final String speakerLinkedIn = 'msalihguler';
  final String speakerAbout =
      "Superlist'te SSE olarak çalışan Salih, Flutter ile ilgili bütün etkinliklerde konuşmacı oluyor...";

  final String sessionName = "Superlist'te nasıl uygulama geliştiriyoruz?";
  final DateTime sessionStartingDate = DateTime(2021, 03, 06, 10, 00);
  final DateTime sessionDueDate = DateTime(2021, 03, 06, 10, 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const SizedBox(height: 36.0),
              SpeakerAbout(about: speakerAbout),
              const SizedBox(height: 36.0),
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
  }

  EdgeInsets _padding(BuildContext context) {
    if (ResponsiveHelper.isLargeScreen(context)) {
      return EdgeInsets.symmetric(horizontal: 72.0, vertical: 72.0);
    } else if (ResponsiveHelper.isLargeScreen(context)) {
      return EdgeInsets.symmetric(horizontal: 48.0, vertical: 48.0);
    } else {
      return EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0);
    }
  }
}

class SpeakerAbout extends StatelessWidget {
  const SpeakerAbout({Key key, @required this.about})
      : assert(about != null),
        super(key: key);

  final String about;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SpeakerDetailSubTitle(title: 'Hakkında'),
        SpeakerDetailSubText(text: about),
      ],
    );
  }
}
