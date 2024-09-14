import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/cubits/home_cubit/home_cubit.dart';
import 'package:todo_list_app/cubits/home_cubit/home_cubit.dart';
import 'package:todo_list_app/recourses/blocks/home_screen_block/todo_item_block.dart';
import 'package:todo_list_app/recourses/blocks/home_screen_block/todo_list_block.dart';
import 'package:todo_list_app/recourses/blocks/home_screen_block/widgets/category_widget.dart';
import 'package:todo_list_app/recourses/blocks/home_screen_block/widgets/title_widget.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';
import 'category_list_block.dart';

class HomeScreenBodyBlock extends StatelessWidget {
  const HomeScreenBodyBlock({super.key});

  @override
  Widget build(BuildContext context) {
    var homCubit = HomeCubit.get(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppVerticalSize.s10),
        const TitleWidget(),
        BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return CategoryListBlock(
              titles: homCubit.categories,
              selectedIndex: homCubit.currentCategory,
              changeCategoryFunction: (index) {
                homCubit.changeCurrentCategory(index: index);
              },
            );
          },
        ),
        BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            return TodoListBlock(items: homCubit.todoListModels,);
          },
        )
      ],
    );
  }
}
