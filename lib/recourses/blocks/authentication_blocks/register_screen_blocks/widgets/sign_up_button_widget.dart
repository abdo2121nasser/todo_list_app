import 'package:flutter/material.dart';

import '../../../../manager_files/color_manager.dart';
import '../../../../manager_files/font_manager.dart';
import '../../../../manager_files/string_manager.dart';
import '../../../../manager_files/values_manager.dart';
import '../../../general_blocks/general_button_block.dart';

class SignUpButtonWidget extends StatelessWidget {
  final VoidCallback function;
  const SignUpButtonWidget({super.key,required this.function});

  @override
  Widget build(BuildContext context) {
    return    GeneralButtonBlock(
      lable: StringManager.ui.kSignUpWord,
      lableSize: FontSize.s14,
      function: (){
        function();
      },
      width: double.maxFinite,
      hight: AppVerticalSize.s50,
      textColor: kWhiteColor,
      backgroundColor: kIndigoColor,
      borderRadius: AppRadiusSize.s10,

    );
  }
}