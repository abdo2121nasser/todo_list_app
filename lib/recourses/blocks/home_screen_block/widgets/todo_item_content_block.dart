import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/blocks/home_screen_block/widgets/todo_item_last_line_widget.dart';
import 'package:todo_list_app/recourses/blocks/home_screen_block/widgets/todo_item_middle_line_widget.dart';

import 'first_line_content_widget.dart';



class TodoItemContentBlock extends StatelessWidget {
  const TodoItemContentBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FirstLineContentWidget(),
        TodoItemMiddleLine(),
        TodoItemLastLineWidget()
      ],
    );
  }
}
