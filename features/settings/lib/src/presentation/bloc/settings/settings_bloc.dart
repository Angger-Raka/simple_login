import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:meta/meta.dart';
import 'package:settings/settings.dart';

import 'package:equatable/equatable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

const _defaultSettings = SettingsState(
  Settings(
    language: Language(
      code: 'en',
      name: 'English',
    ),
    appTheme: AppTheme.dark,
  ),
);

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required this.usecaseSetting,
    required this.usecaseSet,
  }) : super(_defaultSettings) {
    on<InitializeSettings>(_intializeSettings);
    on<SetLanguage>(_setLanguage);
    on<SetAppTheme>(_setAppTheme);
  }

  final SettingsUseCase usecaseSetting;
  final SetSettingUseCase usecaseSet;

  Future<void> _intializeSettings(
    InitializeSettings event,
    Emitter<SettingsState> emit,
  ) async {
    await usecaseSetting.repository.getSettings().then(
          (result) => result.fold(
            (l) => emit(state),
            (r) => emit(SettingsState(r)),
          ),
        );
  }

  Future<void> _setLanguage(
    SetLanguage event,
    Emitter<SettingsState> emit,
  ) async {
    await usecaseSet.repository.setLanguage(event.language).then(
          (result) => result.fold(
            (l) => emit(state),
            (r) => emit(
              SettingsState(
                state.settings.copyWith(language: event.language),
              ),
            ),
          ),
        );
  }

  Future<void> _setAppTheme(
    SetAppTheme event,
    Emitter<SettingsState> emit,
  ) async {
    await usecaseSet.repository.setAppTheme(event.appTheme).then(
          (result) => result.fold(
            (l) => emit(state),
            (r) => emit(
              SettingsState(
                state.settings.copyWith(appTheme: event.appTheme),
              ),
            ),
          ),
        );
  }
}
