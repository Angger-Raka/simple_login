import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension AppThemeX on AppTheme {
  String toText() {
    return describeEnum(this);
  }

  ThemeData toThemeData() {
    switch (this) {
      case AppTheme.dark:
        return DarkTheme().data;
      case AppTheme.light:
        return LightTheme().data;
    }
  }
}
