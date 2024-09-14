import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/manager_files/color_manager.dart';
import 'package:todo_list_app/recourses/manager_files/font_manager.dart';
import 'package:todo_list_app/recourses/manager_files/style_manager.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  const CategoryWidget({super.key,required this.title,
  required this.isSelected
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppHorizontalSize.s14, vertical: AppVerticalSize.s5),
      decoration: BoxDecoration(
        color: isSelected? kIndigoColor: kLightIndigoColor,
        borderRadius: BorderRadius.circular(AppRadiusSize.s20),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: getBoldStyle(fontSize: FontSize.s16, color:isSelected? kWhiteColor:kLightBlackColor),
      ),
    );
  }
}
