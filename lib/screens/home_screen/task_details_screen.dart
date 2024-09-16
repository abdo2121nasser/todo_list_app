import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/manager_files/color_manager.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';
import 'package:todo_list_app/recourses/models/item_model.dart';

import '../../recourses/blocks/general_blocks/general_app_bar_block.dart';
import '../../recourses/blocks/task_details_block/task_details_screen_body_block.dart';
import '../../recourses/manager_files/string_manager.dart';




class TaskDetailsScreen extends StatelessWidget {
  final ItemModel itemModel;
  const TaskDetailsScreen({super.key,required this.itemModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBarBlock(
        title: StringManager.ui.kTaskDetailsWord,
        actions: [
          InkWell(
              onTap: (){},
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: AppHorizontalSize.s14),
                child: const Icon(Icons.more_vert,color: kBlackColor,),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height*1.1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppHorizontalSize.s22),
            child: TaskDetailsScreenBodyBlock(itemModel: itemModel),
          ),
        ),
      ),

    );
  }
}
