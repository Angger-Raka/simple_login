import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_starter/app/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:settings/settings.dart';
import 'package:get_it/get_it.dart';
export './locator.dart';
export './routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const _App();
  }
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetIt.I<SettingsBloc>()..add(const InitializeSettings()),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state.settings.appTheme == null ||
            state.settings.language == null) {
          WidgetsBinding widgetsBinding =
              WidgetsFlutterBinding.ensureInitialized();
          FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
        } else {
          FlutterNativeSplash.remove();
        }
      },
      buildWhen: (previous, current) {
        return previous.settings.appTheme != current.settings.appTheme ||
            previous.settings.language != current.settings.language;
      },
      builder: (context, state) {
        if (state.settings.appTheme == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return MaterialApp.router(
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalizations.delegate,
            ],
            locale: state.settings.language?.toLocale(),
            theme: state.settings.appTheme?.toThemeData(),
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: router,
          );
        }
      },
    );
  }
}
