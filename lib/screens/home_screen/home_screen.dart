import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo_list_app/cubits/home_cubit/home_cubit.dart';
import 'package:todo_list_app/recourses/blocks/change_todo_item_properties_screen/change_todo_item_properties_body.dart';
import 'package:todo_list_app/recourses/blocks/general_blocks/general_app_bar_block.dart';
import 'package:todo_list_app/recourses/manager_files/color_manager.dart';
import 'package:todo_list_app/recourses/manager_files/image_manager.dart';
import 'package:todo_list_app/recourses/manager_files/string_manager.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';
import 'package:todo_list_app/screens/app_bar_screens/profile_screen.dart';
import 'package:todo_list_app/screens/authentication_screens/login_screen.dart';
import '../../recourses/blocks/home_screen_block/app_bar_block.dart';
import '../../recourses/blocks/home_screen_block/home_screen_body.dart';
import 'change_todo_item_properties_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getTodoList(),
      child: Scaffold(
        appBar: const AppBarBlock(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppHorizontalSize.s22),
          child: const HomeScreenBodyBlock(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(CreateTodoItemPropertiesScreen());
          },
          backgroundColor: kIndigoColor,
          child: Icon(
            Icons.add,
            size: AppVerticalSize.s35,
          ),
        ),
      ),
    );
  }
}
