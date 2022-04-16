class Config {
  const Config._();

  static final DateTime now = DateTime.now();

  static final EventConfig eventConfig = EventConfig._();

  static const flutterTurkiye = FlutterTurkiyeSocialMedias._();

  static const supportEmailAddress = 'the.flutter.turkey@gmail.com';

  static const firstDayStreamUrl = 'https://youtu.be/M5sm3EsUmu4';
  static const secondDayStreamUrl = 'https://youtu.be/WdV0uUC-eTw';

  static const attendeeRegistrationUrl =
      'https://www.meetup.com/Flutter-Turkiye/events/283858428/';
  static const callForPapersUrl = 'https://forms.gle/dNoi8zgZN5Bn1cfF8';
}

class FlutterTurkiyeSocialMedias {
  const FlutterTurkiyeSocialMedias._();

  static const twitter = 'https://twitter.com/Flutter_Turkiye';
  static const telegram = 'https://t.me/FlutterTR';
  static const medium = 'https://medium.com/flutter-t%C3%BCrkiye';
  static const discord = 'https://discord.gg/bkSkTzw';
  static const slack = 'https://bit.ly/flutterTR';
  static const github = 'https://github.com/flutterturkey';
  static const youtube = 'https://www.youtube.com/c/fluttert%C3%BCrkiye';
}

class EventConfig {
  EventConfig._();

  final String name = 'Flutter Festival Türkiye';
  final String startingDateName = '16 Nisan Cumartesi';
  final String endingDateName = '17 Nisan Pazar';
  final String informationForStreamUrls = '**Aşağıdaki bağlantılardan**\n'
      'yayına gidebilirsiniz!';
  final String thankYouForAttendingMessage =
      'Etkinliğimize göstermiş olduğunuz ilgi için\n'
      '**TEŞEKKÜR EDERİZ**';

  final DateTime firstDayStartingDate = DateTime(2022, 4, 16, 12, 25);
  final DateTime firstDayEndingDate = DateTime(2022, 4, 16, 19, 30);

  final DateTime secondDayStartingDate = DateTime(2022, 4, 17, 11, 55);
  final DateTime secondDayEndingDate = DateTime(2022, 4, 17, 19, 00);

  final DateTime startingDate = DateTime.utc(2022, 4, 16);
  final DateTime endingDate = DateTime.utc(2022, 4, 17);
}

class CountdownConfig {
  const CountdownConfig._();

  static const waitingEventMessage = "Türkiye'nin en büyük "
      'Flutter Festivali\n'
      '**Flutter Festival Türkiye**\n'
      'başlıyor!';
  static const startedEventMessage = "Türkiye'nin en büyük "
      'Flutter Festivali\n'
      '**Flutter Festival Türkiye**\n'
      'devam ediyor!';
  static const completedEventMessage = "Türkiye'nin en büyük "
      'Flutter Festivali\n'
      '**Flutter Festival Türkiye**\n'
      'bitti!';
}
