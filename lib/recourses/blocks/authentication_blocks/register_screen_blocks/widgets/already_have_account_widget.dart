import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/screens/authentication_screens/login_screen.dart';
import 'package:todo_list_app/screens/authentication_screens/register_screen.dart';

import '../../../../manager_files/color_manager.dart';
import '../../../../manager_files/font_manager.dart';
import '../../../../manager_files/string_manager.dart';
import '../../../../manager_files/style_manager.dart';





class AlreadyHaveAccountWidget extends StatelessWidget {
  const AlreadyHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringManager.ui.kSignUpMessageWord,
          style: getRegularStyle(fontSize: FontSize.s14, color: kHintColor),
        ),
        GestureDetector(
          onTap: (){
            Get.offAll(const LoginScreen());
          },
          child: Text(
            StringManager.ui.kSignInHereWord,
            style: getRegularStyle(fontSize: FontSize.s14, color: kIndigoColor,hasUnderLine: true),

          ),
        ),
      ],
    );
  }
}
