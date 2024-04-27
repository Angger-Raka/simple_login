import 'package:core/core.dart';
import 'package:settings/settings.dart';
import 'package:dartz/dartz.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this.datasources);

  final SettingsLocalDataSources datasources;

  @override
  Future<Either<GenericException, Settings>> getSettings() async {
    try {
      final settings = await datasources.getSettings();
      return Right(settings);
    } on GenericException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<GenericException, bool>> saveSettings(Settings settings) async {
    try {
      final result = await datasources.saveSettings(settings);
      return Right(result);
    } on GenericException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<GenericException, bool>> setLanguage(Language language) async {
    try {
      final result = await datasources.setLanguage(language);
      return Right(result);
    } on GenericException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<GenericException, bool>> setAppTheme(AppTheme appTheme) async {
    try {
      final result = await datasources.setAppTheme(appTheme);
      return Right(result);
    } on GenericException catch (e) {
      return Left(e);
    }
  }
}
