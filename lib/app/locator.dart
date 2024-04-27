import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:settings/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setUpLocator() async {
  _setUpCore();
  _setUpModular();
}

Future<void> _setUpCore() async {
  final prefs = await SharedPreferences.getInstance();
  final dio = Dio();

  getIt
    ..registerLazySingleton<Preference>(() => Preference(prefs))
    ..registerLazySingleton<Dio>(() => DioClient(dio).client);
}

Future<void> _setUpModular() async {
  //! ============================== Settings ============================== //
  //? Data
  getIt.registerLazySingleton<SettingsLocalDataSources>(
    () => SettingsLocalDataSourcesImpl(getIt<Preference>()),
  );
  getIt.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(getIt<SettingsLocalDataSources>()),
  );

  //? Domain
  getIt.registerLazySingleton<SettingsUseCase>(
    () => SettingsUseCase(getIt<SettingsRepository>()),
  );

  getIt.registerLazySingleton(
    () => SetSettingUseCase(getIt<SettingsRepository>()),
  );

  //? Presentation
  getIt.registerFactory(
    () => SettingsBloc(
      usecaseSetting: getIt<SettingsUseCase>(),
      usecaseSet: getIt<SetSettingUseCase>(),
    ),
  );

  //! ============================ End Settings ============================ //

  //! ================================ Home ================================ //
}
