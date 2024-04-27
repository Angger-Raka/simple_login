import 'dart:ui';

import 'package:settings/settings.dart';

extension LanguageX on Language {
  Locale toLocale() => Locale(code!);
}
