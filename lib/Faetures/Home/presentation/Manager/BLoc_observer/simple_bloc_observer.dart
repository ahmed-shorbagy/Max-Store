import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBLocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('Change = $change');
  }

  @override
  void onClose(BlocBase bloc) {
    // TODO: implement onClose
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('create = $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('create = $error');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('create = $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint('transition = $transition');
  }
}
