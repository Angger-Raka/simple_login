import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class AppBlocObserver extends BlocObserver {
  final _logger = Logger(
    filter: null,
    output: null,
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: false,
    ),
  );

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    _logger.log(
      Level.info,
      'onCreate -- ${bloc.runtimeType}',
      stackTrace: StackTrace.empty,
    );
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    _logger.log(
      Level.info,
      'onEvent -- ${bloc.runtimeType}, $event',
      stackTrace: StackTrace.empty,
    );
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    _logger.log(
      Level.info,
      '''
onChange -- ${bloc.runtimeType},
currentState: ${change.currentState},
nextState: ${change.nextState},''',
      stackTrace: StackTrace.empty,
    );
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    _logger.log(
      Level.info,
      '''
onTransition -- ${bloc.runtimeType},
currentState: ${transition.currentState},
event: ${transition.event},''',
      stackTrace: StackTrace.empty,
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    _logger.log(
      Level.error,
      'onError -- ${bloc.runtimeType}',
      error: error,
      stackTrace: stackTrace,
      time: DateTime.now(),
    );
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    _logger.log(
      Level.info,
      'onClose -- ${bloc.runtimeType}',
      stackTrace: StackTrace.empty,
    );
  }
}
