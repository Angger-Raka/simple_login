import 'app_localizations.dart';

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get helloWorld => 'Halo Dunia!';

  @override
  String get settings => 'Pengaturan';

  @override
  String get changeLanguage => 'Ubah Bahasa';

  @override
  String get changeTheme => 'Ubah Tema';

  @override
  String get requiredFill => ' * Wajib diisi';

  @override
  String get invalidEmail => ' * Email tidak valid';

  @override
  String get invalidPhoneNumber => ' * Nomor telepon tidak valid';

  @override
  String get invalidBirthDay => ' * Tanggal lahir tidak valid';

  @override
  String get invalidBirthMonth => ' * Bulan lahir tidak valid';

  @override
  String get invalidBirthYear => ' * Tahun lahir tidak valid';

  @override
  String get atLeast8Chars => ' * Minimal 8 karakter';

  @override
  String get atLeast3Chars => ' * Minimal 3 karakter';
}
