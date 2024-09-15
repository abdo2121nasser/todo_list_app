import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:todo_list_app/cubits/profile_cubit/profile_cubit.dart';
import 'package:todo_list_app/screens/app_bar_screens/profile_screen.dart';
import 'package:todo_list_app/screens/authentication_screens/login_screen.dart';
import 'package:todo_list_app/screens/home_screen/home_screen.dart';
import 'package:todo_list_app/screens/splash_screen.dart';

import '../recourses/manager_files/theme_manager.dart';
import '../screens/home_screen/change_todo_item_properties_screen.dart';

class TodoListApp extends StatelessWidget {
  const TodoListApp.internalConstructor({super.key});

  static const TodoListApp instance = TodoListApp.internalConstructor();

  factory TodoListApp() => instance;

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: true,
      builder: (context) =>
          ScreenUtilInit(
              designSize: const Size(375, 768),
              builder: (context, child) =>
                  GetMaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: getAppTheme(),
                 home: const SplashScreen(),
               //   home: LoginScreen(),
               //      home: CreateTodoItemPropertiesScreen(),
                    //  home: RegisterScreen(),
                 //   home: HomeScreen(),
                 //   home: ProfileScreen(),
                  )),
    );
  }
}
