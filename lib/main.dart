import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_list_app/recourses/manager_files/string_manager.dart';
import 'package:todo_list_app/recourses/models/profile_model.dart';
import 'package:todo_list_app/recourses/services/bloc_observer/bloc_observer.dart';
import 'package:todo_list_app/recourses/services/dio_service.dart';

import 'app_root/app_root.dart';

Future<void> main() async {
  Bloc.observer = MyBlocObserver();

  // await SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  //
  // ]);
  await Hive.initFlutter();
  Hive.registerAdapter(ProfileModelAdapter());
  await Hive.openBox(StringManager.logic.kProfileBox);
  await Hive.openBox(StringManager.logic.kTokenBox);


  DioHelper.init();

  runApp(TodoListApp());
}

