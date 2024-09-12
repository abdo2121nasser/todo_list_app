import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/manager_files/color_manager.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';

import '../../../manager_files/font_manager.dart';
import '../../../manager_files/style_manager.dart';
import 'content_information_widget.dart';

class PersonalInformationContainerWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  const PersonalInformationContainerWidget(
      {super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: AppVerticalSize.s90,
      margin: EdgeInsets.symmetric(horizontal: AppHorizontalSize.s16),
      padding: EdgeInsets.symmetric(horizontal: AppHorizontalSize.s12),
      decoration: BoxDecoration(
          color: kLightGreyColor,
          borderRadius: BorderRadius.circular(AppRadiusSize.s14)),
      child: ContentInformationWidget(
        title: title,
        subTitle: subTitle,
      ),
    );
  }
}
