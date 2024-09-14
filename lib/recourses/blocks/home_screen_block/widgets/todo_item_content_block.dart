import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/blocks/home_screen_block/widgets/todo_item_last_line_widget.dart';
import 'package:todo_list_app/recourses/blocks/home_screen_block/widgets/todo_item_middle_line_widget.dart';
import 'package:todo_list_app/recourses/models/item_model.dart';

import 'first_line_content_widget.dart';



class TodoItemContentBlock extends StatelessWidget {
  final ItemModel item;
  const TodoItemContentBlock({super.key,required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FirstLineContentWidget(title: item.title,status: item.status),
        TodoItemMiddleLine(description: item.desc),
        TodoItemLastLineWidget(dateTime: item.updatedAt,
        priority: item.priority,
        )
      ],
    );
  }
}
