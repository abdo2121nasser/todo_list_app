import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/blocks/home_screen_block/widgets/todo_item_content_block.dart';
import 'package:todo_list_app/recourses/blocks/home_screen_block/widgets/todo_item_image_widget.dart';
import 'package:todo_list_app/recourses/manager_files/image_manager.dart';

class TodoItemBlock extends StatelessWidget {
  const TodoItemBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: TodoItemImageWidget(image: ImageManager.kSmileMan)),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.57,
            child: TodoItemContentBlock()),
        InkWell(onTap: () {}, child: Icon(Icons.more_vert))
      ],
    );
  }
}
