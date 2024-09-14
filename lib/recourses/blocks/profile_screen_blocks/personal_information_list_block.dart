import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/blocks/profile_screen_blocks/widgets/personal_information_widget.dart';
import 'package:todo_list_app/recourses/manager_files/string_manager.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';
import 'package:todo_list_app/recourses/models/profile_model.dart';

import '../../../cubits/profile_cubit/profile_cubit.dart';

class PersonalInformationListBlock extends StatelessWidget {
  final List<String> subTitles;
   PersonalInformationListBlock({super.key,required this.subTitles});
  final List<String> titles=[
    StringManager.ui.kNameWord,
    StringManager.ui.kPhone,
    StringManager.ui.kLevel,
    StringManager.ui.kExperience,
    StringManager.ui.kLocation,
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
        itemBuilder: (context, index) => PersonalInformationContainerWidget(
              title: titles[index],
              subTitle: subTitles[index],
          canBeCopy: index==1,
            ),
        separatorBuilder: (context, index) => SizedBox(
              height: AppVerticalSize.s8,
            ),
        itemCount: titles.length);
  }
}
