import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/blocks/home_screen_block/todo_item_block.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';

import '../../models/item_model.dart';

class TodoListBlock extends StatelessWidget {
  final List<ItemModel> items;
  const TodoListBlock({super.key,required this.items});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: AppVerticalSize.s14),
          itemBuilder: (context, index) =>  SizedBox(
            height:   AppVerticalSize.s80,
              child: TodoItemBlock(item: items[index],)),
          separatorBuilder: (context, index) => SizedBox(height: AppVerticalSize.s12,),
          itemCount: items.length),
    );
  }
}
