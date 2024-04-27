# Flutter Starter

This is a starter project for flutter. Project Flutter is designed by following the Clean Architecture architecture and using BLoC as state management. It aims to produce applications that are structured, easy to maintain, and scalable.

## Get Started

First we create the environment file first

- .env

after that add the following code: (adjust to the API you want to use)

`BASE_URL`

```shell
BASE_URL=https://google.com
```

After that pub get on all modules and parent directories. I have provided a Bash script so that it can be run.

- flutter_clean_all.sh = For flutter clean all flutter projects
- pub_get_all.sh = For pub get all flutter projects

Just run main.dart with

```shell
flutter run
```

## Dependency

Here are some of the list of dependencies in this project:

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

if you're using Visual Studio Code you're can install :

- [Better Comments][better_comments_plugin]
- [Json to Dart Model][json_to_dart_model]
- [Flutter Clean Architecture Feature Scaffolding][clean_architecture_plugin]
- [bloc][bloc_plugin]

## Structure

This project has the following folder structure:

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
    ├── core/
    └── shared/

```

[better_comments_plugin]: https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments
[json_to_dart_model]: https://marketplace.visualstudio.com/items?itemName=hirantha.json-to-dart
[clean_architecture_plugin]: https://marketplace.visualstudio.com/items?itemName=FullyStackedDevelopment.flutter-clean-architecture-scaffold
[bloc_plugin]: https://marketplace.visualstudio.com/items?itemName=FelixAngelov.bloc
[dart_language_badge]: https://img.shields.io/badge/Language-Dart-blue