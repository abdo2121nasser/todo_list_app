import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/manager_files/color_manager.dart';
import 'package:todo_list_app/recourses/manager_files/font_manager.dart';
import 'package:todo_list_app/recourses/manager_files/style_manager.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppHorizontalSize.s10, vertical: AppVerticalSize.s5),
      decoration: BoxDecoration(
        color: kIndigoColor,
        borderRadius: BorderRadius.circular(AppRadiusSize.s20),
      ),
      alignment: Alignment.center,
      child: Text(
        'Inpogress',
        style: getBoldStyle(fontSize: FontSize.s16, color: kWhiteColor),
      ),
    );
  }
}
