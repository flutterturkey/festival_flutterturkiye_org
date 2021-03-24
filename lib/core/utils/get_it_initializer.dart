import 'package:festival_flutterturkiye_org/countdown/logic/countdown_repository.dart';
import 'package:festival_flutterturkiye_org/footer/logic/community_repository.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void initializeGetIt() {
  getIt
    ..registerLazySingleton(() => CountdownRepository())
    ..registerLazySingleton(() => CommunityRepository());
}
