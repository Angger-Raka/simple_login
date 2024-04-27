import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get settings => 'Settings';

  @override
  String get changeLanguage => 'Change Language';

  @override
  String get changeTheme => 'Change Theme';

  @override
  String get requiredFill => ' * Required';

  @override
  String get invalidEmail => ' * Invalid email';

  @override
  String get invalidPhoneNumber => ' * Invalid phone number';

  @override
  String get invalidBirthDay => ' * Invalid';

  @override
  String get invalidBirthMonth => ' * Invalid';

  @override
  String get invalidBirthYear => ' * Invalid';

  @override
  String get atLeast8Chars => ' * At least 8 characters';

  @override
  String get atLeast3Chars => ' * At least 3 characters';
}
