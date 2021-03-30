import 'package:get_it/get_it.dart';

import 'package:festival_flutterturkiye_org/core/logic/session_repository.dart';
import 'package:festival_flutterturkiye_org/core/logic/speaker_repository.dart';
import 'package:festival_flutterturkiye_org/countdown/logic/countdown_repository.dart';
import 'package:festival_flutterturkiye_org/footer/logic/community_repository.dart';

GetIt getIt = GetIt.instance;

void initializeGetIt() {
  getIt
    ..registerLazySingleton(() => CountdownRepository())
    ..registerLazySingleton(() => CommunityRepository())
    ..registerLazySingleton(() => SessionRepository())
    ..registerLazySingleton(() => SpeakerRepository());
}
