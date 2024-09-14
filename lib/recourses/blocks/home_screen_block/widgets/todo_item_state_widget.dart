import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/manager_files/color_manager.dart';
import 'package:todo_list_app/recourses/manager_files/string_manager.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';

import '../../../manager_files/font_manager.dart';
import '../../../manager_files/style_manager.dart';

class TodoItemStateWidget extends StatelessWidget {
  final String status;
  const TodoItemStateWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppHorizontalSize.s8, vertical: AppVerticalSize.s2),
      decoration: BoxDecoration(
          color: _getContainerColor,
          borderRadius: BorderRadius.circular(AppRadiusSize.s6)),
      child: Text(
        status,
        style: getMediumStyle(fontSize: FontSize.s12, color: _getTextColor),
      ),
    );
  }

  get _getContainerColor {
    if (status == StringManager.ui.kInProgressWord) {
      return kLightIndigoColor;
    } else if (status == StringManager.ui.kFinishedWord) {
      return kLightBlueColor;
    } else {
      return kLightOrangeColor;
    }
  }
  get _getTextColor {
    if (status == StringManager.ui.kInProgressWord) {
      return kIndigoColor;
    } else if (status == StringManager.ui.kFinishedWord) {
      return kBlueColor;
    } else {
      return kOrangeColor;
    }
  }
}
