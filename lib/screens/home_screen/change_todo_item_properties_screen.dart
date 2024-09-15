import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/blocks/general_blocks/general_app_bar_block.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';

import '../../recourses/blocks/change_todo_item_properties_screen/change_todo_item_properties_body.dart';
import '../../recourses/manager_files/string_manager.dart';

class CreateTodoItemPropertiesScreen extends StatelessWidget {
  const CreateTodoItemPropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBarBlock(
        title: StringManager.ui.kAddNewTaskWord,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppHorizontalSize.s22),
        child: SingleChildScrollView(
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: const ChangeTodoItemPropertiesBody())),
      ),

    );
  }
}
