import 'package:flutter/services.dart';

Future<void> systemOrientation(ScreenOrientation screen) async {
  await SystemChrome.setPreferredOrientations(
    screen == ScreenOrientation.landscape
        ? [
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]
        : [
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ],
  );
}

enum ScreenOrientation { portrait, landscape }
