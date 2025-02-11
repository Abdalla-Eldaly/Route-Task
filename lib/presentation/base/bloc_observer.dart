import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import 'base_states.dart';


class AppMyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) log('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) log('onChange -- ${bloc.runtimeType}, $change');

    if (change.nextState is ErrorState) {
      if (kDebugMode) {
        log(
            'Failure: code= ${(change.nextState as ErrorState).failure.code} msg: code= ${(change.nextState as ErrorState).failure.message}');
      }
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    if (kDebugMode) print('onClose -- ${bloc.runtimeType}');
  }
}
