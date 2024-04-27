part of 'settings_bloc.dart';

@immutable
sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object?> get props => [];
}

class InitializeSettings extends SettingsEvent {
  const InitializeSettings();
}

class SetLanguage extends SettingsEvent {
  const SetLanguage(this.language);

  final Language language;

  @override
  List<Object?> get props => [language];
}

class SetAppTheme extends SettingsEvent {
  const SetAppTheme(this.appTheme);

  final AppTheme appTheme;

  @override
  List<Object?> get props => [appTheme];
}
