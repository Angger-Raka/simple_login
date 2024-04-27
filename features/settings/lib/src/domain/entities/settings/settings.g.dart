// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Settings _$SettingsFromJson(Map<String, dynamic> json) => Settings(
      language: json['language'] == null
          ? null
          : Language.fromJson(json['language'] as Map<String, dynamic>),
      appTheme: $enumDecodeNullable(_$AppThemeEnumMap, json['appTheme']),
    );

Map<String, dynamic> _$SettingsToJson(Settings instance) => <String, dynamic>{
      'language': instance.language,
      'appTheme': _$AppThemeEnumMap[instance.appTheme],
    };

const _$AppThemeEnumMap = {
  AppTheme.light: 'light',
  AppTheme.dark: 'dark',
};
