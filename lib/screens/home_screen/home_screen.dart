import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
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
    return Scaffold(
      appBar: GeneralAppBarBlock(
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
              // _logOut();
            },
            icon: const Icon(Icons.logout_outlined,color: kIndigoColor,),
            color: kBlackColor,
          )
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: AppHorizontalSize.s22),
        child: HomeScreenBodyBlock(),
      ),





    );
  }









  // _logOut() async {
  //   final profileBox = Hive.box(StringManager.logic.kProfileBox);
  //   final tokenBox = Hive.box(StringManager.logic.kTokenBox);
  //   String refreshToken = tokenBox.get(StringManager.logic.kRefreshToken);
  //   String accessToken = tokenBox.get(StringManager.logic.kAccessToken);
  //   try {
  //     dio.Response response = await DioHelper.postData(
  //         url: StringManager.logic.kLogOutEndPoint,
  //         data: {
  //           // "token":
  //           //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjQ5ZmIyZWVmMGJmOTNkZDAwNzExYmEiLCJpYXQiOjE3MjYzMTc2MDd9.0cuVZ9-NCAXXzsW4igtu6cTklZxCyvAuP1lRlZKFtd"
  //         },
  //         token:
  //             "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjQ5ZmIyZWVmMGJmOTNkZDAwNzExYmEiLCJpYXQiOjE3MjYzMTgxMzUsImV4cCI6MTcyNjMxODczNX0.tGqwpFIGhk20k7RciqOCMmSHiN18M91kTuoMQ4ebaWM");
  //     if (response.statusCode! >= 200 && response.statusCode! < 300) {
  //       profileBox.clear();
  //       tokenBox.clear();
  //       Get.offAll(() => const LoginScreen());
  //     }
  //   } catch (error) {
  //     debugPrint(error.toString());
  //   }
  // }
}
