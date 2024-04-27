import 'package:core/core.dart';
import 'package:settings/settings.dart';
import 'package:dartz/dartz.dart';

mixin SettingsRepository {
  Future<Either<GenericException, Settings>> getSettings();
  Future<Either<GenericException, bool>> saveSettings(Settings settings);
  Future<Either<GenericException, bool>> setLanguage(Language language);
  Future<Either<GenericException, bool>> setAppTheme(AppTheme appTheme);
}
