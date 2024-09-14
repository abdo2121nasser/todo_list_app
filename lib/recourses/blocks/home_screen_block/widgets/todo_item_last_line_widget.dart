import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/manager_files/color_manager.dart';

import '../../../manager_files/font_manager.dart';
import '../../../manager_files/style_manager.dart';
import 'flage_widget.dart';

class TodoItemLastLineWidget extends StatelessWidget {
  const TodoItemLastLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FlagWidget(),
        Text(
          '30/12/2022',
          style:
              getRegularStyle(fontSize: FontSize.s12, color: kMixedGreyColor),
        )
      ],
    );
  }
}
