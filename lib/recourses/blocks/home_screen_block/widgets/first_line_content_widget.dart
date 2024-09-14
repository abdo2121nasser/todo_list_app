import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/blocks/home_screen_block/widgets/todo_item_state_widget.dart';
import 'package:todo_list_app/recourses/manager_files/color_manager.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';

import '../../../manager_files/font_manager.dart';
import '../../../manager_files/style_manager.dart';



class FirstLineContentWidget extends StatelessWidget {
  const FirstLineContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
           'Grocery Shopping App',
            style: getBoldStyle(fontSize: FontSize.s16, color: kBlackColor),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: AppHorizontalSize.s5,),
        TodoItemStateWidget()

      ],
    );
  }
}
