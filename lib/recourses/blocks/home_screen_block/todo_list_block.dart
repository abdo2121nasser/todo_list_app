import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/cubits/home_cubit/home_cubit.dart';
import 'package:todo_list_app/recourses/blocks/home_screen_block/todo_item_block.dart';
import 'package:todo_list_app/recourses/manager_files/color_manager.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';

import '../../../screens/home_screen/task_details_screen.dart';
import '../../models/item_model.dart';

class TodoListBlock extends StatelessWidget {
  final List<ItemModel> items;
  final VoidCallback getMoreItemsFunction;
  final HomeState state;
  final bool isFullList;

  const TodoListBlock({
    super.key,
    required this.items,
    required this.getMoreItemsFunction,
    required this.state,
    required this.isFullList,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels >=
                scrollInfo.metrics.maxScrollExtent * 0.9 &&
            !isFullList &&
            state is! GetMoreTodoListItemsLoadingState) {
          getMoreItemsFunction();
        }
        return false;
      },
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: AppVerticalSize.s14),
        itemBuilder: (context, index) {
          if (index == items.length) {
            return state is GetMoreTodoListItemsLoadingState
                ? const Center(
                    child: CircularProgressIndicator(
                      color: kIndigoColor,
                    ),
                  )
                : const SizedBox
                    .shrink();
          }
          return InkWell(
            onTap: (){
              Get.to(TaskDetailsScreen(itemModel: items[index],));
            },
            child: SizedBox(
              height: AppVerticalSize.s80,
              child: TodoItemBlock(item: items[index]),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          height: AppVerticalSize.s12,
        ),
        itemCount: isFullList
            ? items.length
            : (state is GetMoreTodoListItemsLoadingState
                ? items.length + 1
                : items.length),
      ),
    );
  }
}
