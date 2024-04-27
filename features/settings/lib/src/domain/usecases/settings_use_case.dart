import 'package:core/core.dart';
import 'package:core/params/noparams.dart';
import 'package:dartz/dartz.dart';
import 'package:settings/settings.dart';

class SettingsUseCase implements UseCase<Settings, NoParams> {
  final SettingsRepository repository;

  SettingsUseCase(this.repository);

  @override
  Future<Either<GenericException, Settings>> call(NoParams params) async {
    return await repository.getSettings();
  }
}
