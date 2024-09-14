import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/blocks/home_screen_block/widgets/todo_item_state_widget.dart';
import 'package:todo_list_app/recourses/manager_files/color_manager.dart';
import 'package:todo_list_app/recourses/manager_files/string_manager.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';

import '../../../manager_files/font_manager.dart';
import '../../../manager_files/style_manager.dart';



class FirstLineContentWidget extends StatelessWidget {
  final String title;
  final String status;

  const FirstLineContentWidget({super.key,required this.title,required this.status});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
           title,
            style: getBoldStyle(fontSize: FontSize.s16, color: kBlackColor),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        TodoItemStateWidget(status: status,)

      ],
    );
  }
}
