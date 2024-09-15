import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo_list_app/cubits/home_cubit/home_cubit.dart';
import 'package:todo_list_app/recourses/blocks/general_blocks/general_app_bar_block.dart';
import 'package:todo_list_app/recourses/manager_files/color_manager.dart';
import 'package:todo_list_app/recourses/manager_files/image_manager.dart';
import 'package:todo_list_app/recourses/manager_files/string_manager.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';
import 'package:todo_list_app/recourses/services/dio_service.dart';
import 'package:todo_list_app/screens/app_bar_screens/profile_screen.dart';
import 'package:todo_list_app/screens/authentication_screens/login_screen.dart';
import 'package:dio/dio.dart' as dio;

import '../../recourses/blocks/home_screen_block/category_list_block.dart';
import '../../recourses/blocks/home_screen_block/home_screen_body.dart';
import '../../recourses/blocks/home_screen_block/widgets/title_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getTodoList(),
      child: Scaffold(
        appBar: _appBar,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppHorizontalSize.s22),
          child: HomeScreenBodyBlock(),
        ),
      ),
    );
  }





  GeneralAppBarBlock get _appBar {
    return GeneralAppBarBlock(
        title: StringManager.ui.kLogo,
        haveReturnArrow: false,
        actions: [
          InkWell(
              borderRadius: BorderRadius.circular(AppRadiusSize.s36),
              onTap: () {
               Get.to(() => const ProfileScreen());
              },
              child: Image.asset(ImageManager.kPersonImage)),
          IconButton(
            onPressed: () {
              _logOut();
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: kIndigoColor,
            ),
            color: kBlackColor,
          )
        ],
      );
  }

  _logOut() async {
    final profileBox = Hive.box(StringManager.logic.kProfileBox);
    final tokenBox = Hive.box(StringManager.logic.kTokenBox);
    String refreshToken = tokenBox.get(StringManager.logic.kRefreshToken);
    String accessToken = tokenBox.get(StringManager.logic.kAccessToken);
    profileBox.clear();
    tokenBox.clear();
    Get.offAll(() => const LoginScreen());
  }
}
