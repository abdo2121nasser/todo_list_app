import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:todo_list_app/screens/authentication_screens/login_screen.dart';

import '../recourses/manager_files/theme_manager.dart';
import '../screens/authentication_screens/register_screen.dart';

class TodoListApp extends StatelessWidget {
  const TodoListApp.internalConstructor({super.key});

  static const TodoListApp instance = TodoListApp.internalConstructor();

  factory TodoListApp() => instance;

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: true,
      builder: (context) => SafeArea(
        child: ScreenUtilInit(
            designSize: const Size(375, 768),
            builder: (context, child) =>  GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: getAppTheme(),
             home: LoginScreen(),
             //  home: RegisterScreen(),
                )),
      ),
    );
  }
}
