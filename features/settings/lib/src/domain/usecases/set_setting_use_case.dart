import 'dart:async';

import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:settings/settings.dart';

mixin SetSettings {
  FutureOr<Either<GenericException, bool>> save({
    required Settings settings,
  });
  FutureOr<Either<GenericException, bool>> setLanguage({
    required Language language,
  });
  FutureOr<Either<GenericException, bool>> setAppTheme({
    required AppTheme appTheme,
  });
}

class SetSettingUseCase implements SetSettings {
  final SettingsRepository repository;

  SetSettingUseCase(this.repository);

  @override
  FutureOr<Either<GenericException, bool>> save({
    required Settings settings,
  }) async {
    return await repository.saveSettings(settings);
  }

  @override
  FutureOr<Either<GenericException, bool>> setLanguage({
    required Language language,
  }) async {
    return await repository.setLanguage(language);
  }

  @override
  FutureOr<Either<GenericException, bool>> setAppTheme({
    required AppTheme appTheme,
  }) async {
    return await repository.setAppTheme(appTheme);
  }
}
