import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:todo_list_app/recourses/blocks/change_todo_item_properties_screen/widgets/priority_widget.dart';
import 'package:todo_list_app/recourses/blocks/task_details_block/widgets/date_widget.dart';
import 'package:todo_list_app/recourses/blocks/task_details_block/widgets/image_widget.dart';
import 'package:todo_list_app/recourses/blocks/task_details_block/widgets/qr_code_widget.dart';
import 'package:todo_list_app/recourses/blocks/task_details_block/widgets/show_progress_widget.dart';
import 'package:todo_list_app/recourses/blocks/task_details_block/widgets/title_and_desc_widget.dart';
import 'package:todo_list_app/recourses/manager_files/string_manager.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';

import '../../models/item_model.dart';

class TaskDetailsScreenBodyBlock extends StatelessWidget {
  final ItemModel itemModel;

  const TaskDetailsScreenBodyBlock({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ImageWidget(image: itemModel.image!),
        Padding(
          padding: EdgeInsets.only(bottom: AppVerticalSize.s2),
          child: TitleAndDescWidget(
            title: itemModel.title,
            description: itemModel.desc,
          ),
        ),
        DateWidget(dateTime: itemModel.updatedAt),
        ShowTextWidget(text: itemModel.status, hasFlag: false),
        ShowTextWidget(
            text: '${itemModel.priority} ${StringManager.ui.kPriorityWord}',
            hasFlag: true),
        QrCodeWidget(
          id: itemModel.id,
        )
      ],
    );
  }
}
