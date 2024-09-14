import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hive/hive.dart';

import '../recourses/manager_files/string_manager.dart';
import '../recourses/services/dio_service.dart';
import 'authentication_screens/login_screen.dart';
import 'home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      checkLoginStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  Future<void> checkLoginStatus() async {
    final token = Hive.box(StringManager.logic.kTokenBox);
    String? accessToken = token.get(StringManager.logic.kAccessToken);
    if (accessToken != null) {
      await _refreshToken();
      Get.to(() => const HomeScreen());
    } else {
      Get.to(() => const LoginScreen());
    }
  }

  _refreshToken() async {
    try {
      final token = Hive.box(StringManager.logic.kTokenBox);
      String refreshToken = token.get(StringManager.logic.kRefreshToken);
      dio.Response response = await DioHelper.getData(
          url: StringManager.logic.kRefreshTokenEndPoint +
              StringManager.logic.kRefreshTokenQuery +
              refreshToken);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        token.put(StringManager.logic.kAccessToken,
            response.data[StringManager.logic.kAccessToken]);
      }
    } catch (error) {
      debugPrint(error.toString());
      Get.to(LoginScreen());
    }
  }
}
