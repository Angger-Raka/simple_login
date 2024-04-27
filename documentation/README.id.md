# Flutter Starter

Ini adalah sebuah projek starter untuk flutter. Project Flutter ini dirancang dengan mengikuti arsitektur Clean Architecture dan menggunakan BLoC sebagai state management. Hal ini bertujuan untuk menghasilkan aplikasi yang terstruktur, mudah dirawat, dan skalabel.

## Get Started

Pertama kita buat terlebih dahulu file environment

- .env

setelah itu tambahkan kode berikut: (sesuaikan dengan API yang ingin di gunakan)

`BASE_URL`

```shell
BASE_URL=https://google.com
```

Setelah itu pub get pada seluruh module dan parent directory. saya sudah menyediakan script Bash sehingga dapat di jalankan.

- flutter_clean_all.sh = untuk flutter clean semua projek flutter
- pub_get_all.sh = untuk pub get semua projek flutter

tinggal jalankan main.dart dengan

```shell
flutter run
```

## Dependency

Ini adalah bebrapa list Dependency yang ada di projek ini:

| Plugin                | Version |
| --------------------- | ------- |
| Dio                   | ^5.3.3  |
| equatable             | ^2.0.5  |
| dartz                 | ^0.10.1 |
| build_runner          | ^2.4.6  |
| flutter_bloc          | ^8.1.3  |
| flutter_dotenv        | ^5.1.0  |
| flutter_localizations | 0.1.14  |
| get_it                | ^7.6.4  |
| go_router             | ^12.0.1 |
| json_annotation       | ^4.8.1  |
| json_serializable     | ^6.7.1  |
| shared_preferences    | ^2.2.2  |
| intl                  | ^0.18.1 |

## Plugins

jika kamu menggunakan Visual Studio Code :

- [Better Comments][better_comments_plugin]
- [Json to Dart Model][json_to_dart_model]
- [Flutter Clean Architecture Feature Scaffolding][clean_architecture_plugin]
- [bloc][bloc_plugin]

## Structure

projek ini memiliki structure folder berikut:

```
Flutter-Starter/
├── featrures/
│   ├── settings/
│   │   └── lib/
│   │       └── src/
│   │           ├── data/
│   │           │   ├── data_sources/
│   │           │   ├── models/
│   │           │   └── repositories/
│   │           ├── domain/
│   │           │   ├── entities/
│   │           │   ├── repository/
│   │           │   └── use_cases/
│   │           └── presentation/
│   │               ├── bloc/
│   │               ├── pages/
│   │               └── widgets/
│   └── home(same as settings)
├── lib/
│   ├── app/
│   └── l10n/
└── libraries/
    └── core/

```

[better_comments_plugin]: https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments
[json_to_dart_model]: https://marketplace.visualstudio.com/items?itemName=hirantha.json-to-dart
[clean_architecture_plugin]: https://marketplace.visualstudio.com/items?itemName=FullyStackedDevelopment.flutter-clean-architecture-scaffold
[bloc_plugin]: https://marketplace.visualstudio.com/items?itemName=FelixAngelov.bloc
[dart_language_badge]: https://img.shields.io/badge/Language-Dart-blue