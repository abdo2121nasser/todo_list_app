import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/manager_files/color_manager.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';

import '../../../manager_files/font_manager.dart';
import '../../../manager_files/style_manager.dart';


class TodoItemStateWidget extends StatelessWidget {
  const TodoItemStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppHorizontalSize.s8,vertical: AppVerticalSize.s2),
      decoration: BoxDecoration(
        color: kIndigoColor,
        borderRadius: BorderRadius.circular(AppRadiusSize.s6)
      ),
      child:Text(
        'Waiting',
        style: getMediumStyle(fontSize: FontSize.s12, color: kOrangeColor),
      )

      ,
    );
  }
}
