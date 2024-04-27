import 'dart:convert';

import 'package:core/core.dart';
import 'package:settings/settings.dart';

mixin SettingsLocalDataSources {
  Future<Settings> getSettings();
  Future<bool> saveSettings(Settings settings);
  Future<bool> setLanguage(Language language);
  Future<bool> setAppTheme(AppTheme appTheme);
}

class SettingsLocalDataSourcesImpl implements SettingsLocalDataSources {
  SettingsLocalDataSourcesImpl(
    this.prefs,
  );

  final Preference prefs;

  @override
  Future<Settings> getSettings() async {
    try {
      final isCached = await prefs.isContainsKey(PreferenceKeys.settings);
      if (isCached) {
        final data = await prefs.getString(PreferenceKeys.settings);
        final settings = json.decode(data);
        return Settings.fromJson(settings);
      } else {
        throw const CacheException("Chached data not found");
      }
    } catch (e) {
      throw const CacheException("Chached data not found");
    }
  }

  @override
  Future<bool> saveSettings(Settings settings) async {
    try {
      final isCached = await prefs.isContainsKey(PreferenceKeys.settings);
      if (isCached) {
        await prefs.remove(PreferenceKeys.settings);
        await prefs.setString(
          PreferenceKeys.settings,
          json.encode(settings),
        );
        return true;
      } else {
        await prefs.setString(
          PreferenceKeys.settings,
          json.encode(settings),
        );
        return true;
      }
    } catch (e) {
      throw const CacheException("Chached data not found");
    }
  }

  @override
  Future<bool> setLanguage(Language language) async {
    try {
      final isCached = await prefs.isContainsKey(PreferenceKeys.settings);
      if (isCached) {
        final data = await prefs.getString(PreferenceKeys.settings);
        final settings = json.decode(data);
        final newSettings = Settings.fromJson(settings).copyWith(
          language: language,
        );
        await prefs.remove(PreferenceKeys.settings);
        await prefs.setString(
          PreferenceKeys.settings,
          json.encode(newSettings),
        );
        return true;
      } else {
        final newSettings = Settings(language: language, appTheme: null);
        await prefs.setString(
          PreferenceKeys.settings,
          json.encode(newSettings),
        );
        return true;
      }
    } catch (e) {
      throw const CacheException("Chached data not found");
    }
  }

  @override
  Future<bool> setAppTheme(AppTheme appTheme) async {
    try {
      final isCached = await prefs.isContainsKey(PreferenceKeys.settings);
      if (isCached) {
        final data = await prefs.getString(PreferenceKeys.settings);
        final settings = json.decode(data);
        final newSettings = Settings.fromJson(settings).copyWith(
          appTheme: appTheme,
        );
        await prefs.remove(PreferenceKeys.settings);
        await prefs.setString(
          PreferenceKeys.settings,
          json.encode(newSettings),
        );
        return true;
      } else {
        final newSettings = Settings(appTheme: appTheme, language: null);
        await prefs.setString(
          PreferenceKeys.settings,
          json.encode(newSettings),
        );
        return true;
      }
    } catch (e) {
      throw const CacheException("Chached data not found");
    }
  }
}
