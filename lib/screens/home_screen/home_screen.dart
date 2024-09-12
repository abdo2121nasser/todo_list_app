import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/recourses/blocks/general_blocks/general_app_bar_block.dart';
import 'package:todo_list_app/recourses/manager_files/color_manager.dart';
import 'package:todo_list_app/recourses/manager_files/image_manager.dart';
import 'package:todo_list_app/recourses/manager_files/string_manager.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';
import 'package:todo_list_app/screens/app_bar_screens/profile_screen.dart';

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
            onPressed: () {},
            icon: const Icon(Icons.logout_outlined),
            color: kBlackColor,
          )
        ],
      ),

      
    );
  }
}
