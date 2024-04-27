part of 'settings_bloc.dart';

final class SettingsState extends Equatable {
  const SettingsState(this.settings);

  final Settings settings;

  @override
  List<Object?> get props => [settings];
}
