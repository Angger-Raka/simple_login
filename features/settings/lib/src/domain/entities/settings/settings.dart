import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:settings/src/domain/entities/language/language.dart';

part 'settings.g.dart';

@JsonSerializable()
class Settings extends Equatable {
  final Language? language;
  final AppTheme? appTheme;

  const Settings({required this.language, required this.appTheme});

  factory Settings.fromJson(Map<String, dynamic> json) {
    return _$SettingsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SettingsToJson(this);

  Settings copyWith({
    Language? language,
    AppTheme? appTheme,
  }) {
    return Settings(
      language: language ?? this.language,
      appTheme: appTheme ?? this.appTheme,
    );
  }

  @override
  List<Object?> get props => [language, appTheme];
}
