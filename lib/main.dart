import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:route_task/presentation/base/bloc_observer.dart';

import 'app/app.dart';
import 'app/di.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  Bloc.observer = AppMyBlocObserver();
  runApp(const MyApp());
}


