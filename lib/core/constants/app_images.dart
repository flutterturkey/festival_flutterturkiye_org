import '../extensions/string/image_path_extension.dart';

class AppImages {
  static AppImages _instance;
  static AppImages get instance {
    _instance ??= AppImages._init();
    return _instance;
  }

  AppImages._init();

  String get logo => 'logo'.toPNG;
}
