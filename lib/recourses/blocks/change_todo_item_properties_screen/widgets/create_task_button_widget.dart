import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/manager_files/font_manager.dart';
import 'package:todo_list_app/recourses/manager_files/string_manager.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';

import '../../../manager_files/color_manager.dart';
import '../../general_blocks/general_button_block.dart';

class CreateTaskButtonWidget extends StatelessWidget {
  final VoidCallback buttonFunction;
  const CreateTaskButtonWidget({super.key,required this.buttonFunction});

  @override
  Widget build(BuildContext context) {
    return GeneralButtonBlock(
        lable: StringManager.ui.kAddTaskWord,
        lableSize: FontSize.s20,
        function: () {
          buttonFunction();
        },
        width: double.maxFinite,
        hight: AppVerticalSize.s60,
        textColor: kWhiteColor,
        backgroundColor: kIndigoColor,
        borderRadius: AppRadiusSize.s14);
  }
}
