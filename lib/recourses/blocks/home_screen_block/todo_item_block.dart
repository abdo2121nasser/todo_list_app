import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/blocks/home_screen_block/widgets/todo_item_content_block.dart';
import 'package:todo_list_app/recourses/blocks/home_screen_block/widgets/todo_item_image_widget.dart';
import 'package:todo_list_app/recourses/manager_files/image_manager.dart';
import 'package:todo_list_app/recourses/models/item_model.dart';

class TodoItemBlock extends StatelessWidget {
  final ItemModel item;
  const TodoItemBlock({super.key,required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: TodoItemImageWidget(image: item.image??'')),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.57,
            child: TodoItemContentBlock( item: item,)),
        InkWell(onTap: () {}, child: const Icon(Icons.more_vert))
      ],
    );
  }
}
