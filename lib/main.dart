import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_list_app/recourses/services/bloc_observer/bloc_observer.dart';

import 'app_root/app_root.dart';

Future<void> main() async {
  Bloc.observer = MyBlocObserver();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,

  ]);

  runApp(TodoListApp());
}

