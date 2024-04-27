import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/settings.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final baseUrl = GetIt.I<Dio>().options.baseUrl;

    Future<void> changeTheme(AppTheme theme) async {
      theme == AppTheme.dark
          ? context.read<SettingsBloc>().add(
                const SetAppTheme(AppTheme.light),
              )
          : context.read<SettingsBloc>().add(
                const SetAppTheme(AppTheme.dark),
              );
    }

    Future<void> changeLanguage(Language language) async {
      language.code == 'en'
          ? context.read<SettingsBloc>().add(
                const SetLanguage(
                  Language(code: 'id', name: 'Indonesia'),
                ),
              )
          : context.read<SettingsBloc>().add(
                const SetLanguage(
                  Language(code: 'en', name: 'English'),
                ),
              );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(l10n.helloWorld),
          10.sbh,
          Text(baseUrl),
          10.sbh,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final theme =
                      context.read<SettingsBloc>().state.settings.appTheme;
                  await changeTheme(theme!);
                },
                child: Text(l10n.changeTheme),
              ),
              15.sbw,
              ElevatedButton(
                onPressed: () async {
                  final language =
                      context.read<SettingsBloc>().state.settings.language;
                  await changeLanguage(language!);
                },
                child: Text(l10n.changeLanguage),
              ),
            ],
          )
        ],
      ),
    );
  }
}
