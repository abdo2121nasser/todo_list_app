import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../screens/app_bar_screens/profile_screen.dart';
import '../../../screens/authentication_screens/login_screen.dart';
import '../../manager_files/color_manager.dart';
import '../../manager_files/image_manager.dart';
import '../../manager_files/string_manager.dart';
import '../../manager_files/values_manager.dart';
import '../general_blocks/general_app_bar_block.dart';



class AppBarBlock extends StatelessWidget implements PreferredSizeWidget{
  const AppBarBlock({super.key});

  @override
  Widget build(BuildContext context) {
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

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
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
