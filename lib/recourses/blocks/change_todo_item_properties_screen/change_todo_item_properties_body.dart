import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_list_app/cubits/add_new_task_cubit/add_new_task_cubit.dart';
import 'package:todo_list_app/cubits/add_new_task_cubit/add_new_task_cubit.dart';
import 'package:todo_list_app/recourses/blocks/change_todo_item_properties_screen/priority_block.dart';
import 'package:todo_list_app/recourses/blocks/change_todo_item_properties_screen/widgets/create_task_button_widget.dart';
import 'package:todo_list_app/recourses/blocks/change_todo_item_properties_screen/widgets/full_input_widget.dart';
import 'package:todo_list_app/recourses/blocks/change_todo_item_properties_screen/widgets/pick_image_widget.dart';
import 'package:todo_list_app/recourses/blocks/change_todo_item_properties_screen/widgets/title_text_widget.dart';
import 'package:todo_list_app/recourses/blocks/general_blocks/general_button_block.dart';
import 'package:todo_list_app/recourses/manager_files/string_manager.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';

import '../../manager_files/color_manager.dart';

class ChangeTodoItemPropertiesBody extends StatelessWidget {
  const ChangeTodoItemPropertiesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNewTaskCubit(),
      child: BlocConsumer<AddNewTaskCubit, AddNewTaskState>(
        listener: (context, state) {},
        builder: (context, state) {
          var addCubit = AddNewTaskCubit.get(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: AppVerticalSize.s5),
                child: PickImageWidget(
                  imageFile: addCubit.imageFile,
                  pickImage: () {
                    _showImageSourceSelection(context, function: (source) {
                      addCubit.pickImage(imageSource: source);
                    });
                  },
                ),
              ),
              FullInputWidget(
                title: StringManager.ui.kTaskTitleWord,
                hint: StringManager.ui.kTaskHintWord,
                multiLine: false,
                controller: addCubit.titleController,
              ),
              FullInputWidget(
                title: StringManager.ui.kDescriptionTitleWord,
                hint: StringManager.ui.kDescriptionHintWord,
                multiLine: true,
                controller: addCubit.descriptionController,
              ),
              PriorityBlock(
                selectedValue: addCubit.prioritySelectedValue,
                changeSelectedValueFunction: (value) {
                  addCubit.changePrioritySelectedValue(value: value);
                },
              ),
              FullInputWidget(
                title: StringManager.ui.kDateTitleWord,
                hint: StringManager.ui.kDateHintWord,
                controller: addCubit.dateController,
                multiLine: false,
                suffixIcon: const Icon(
                  Icons.calendar_month,
                  color: kIndigoColor,
                ),
                suffixIconFunction: () {
addCubit.selectDateTime(context);
                },
              ),
               CreateTaskButtonWidget(buttonFunction: (){
                addCubit.addTaskProcess();
               },)
            ],
          );
        },
      ),
    );
  }
}

_showImageSourceSelection(context,
    {required Function(ImageSource) function}) async {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(
              Icons.camera,
              color: kIndigoColor,
            ),
            title: const Text('Take a photo'),
            onTap: () async {
              Get.back(); // Close the bottom sheet
              function(ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.photo_library,
              color: kIndigoColor,
            ),
            title: const Text('Select from gallery'),
            onTap: () async {
              Get.back(); // Close the bottom sheet
              function(ImageSource.gallery);
            },
          ),
        ],
      );
    },
  );
}
