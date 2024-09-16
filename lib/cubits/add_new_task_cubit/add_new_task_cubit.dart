import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:intl/intl.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:todo_list_app/recourses/manager_files/color_manager.dart';
import 'package:todo_list_app/recourses/manager_files/toast_massage_manager.dart';
import 'package:todo_list_app/recourses/services/dio_service.dart';

import '../../recourses/manager_files/string_manager.dart';

part 'add_new_task_state.dart';

class AddNewTaskCubit extends Cubit<AddNewTaskState> {
  AddNewTaskCubit() : super(AddNewTaskInitial());

  static AddNewTaskCubit get(context) => BlocProvider.of(context);

  DateTime currentDate = DateTime.now();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController(
      text: DateFormat('dd/MM/yyyy').format(DateTime.now()));

  String prioritySelectedValue = StringManager.ui.kHighWord;

  String pickedFilename = '';
  File? imageFile;
  String imageLink = '';

  changePrioritySelectedValue({required String value}) {
    prioritySelectedValue = value;
    emit(ChangePrioritySelectedValue());
  }

  Future<void> pickImage({required ImageSource imageSource}) async {
    try {
      emit(PickImageLoadingState());
      final pickedFile = await ImagePicker().pickImage(source: imageSource);
      if (pickedFile != null) {
        pickedFilename = pickedFile.path.split('/').last;
        imageFile = File(pickedFile.path);
        emit(PickImageSuccessState());
      } else {
        emit(PickImageEmptyState());
        debugPrint('no image selected');
      }
    } catch (error) {
      emit(PickImageEmptyState());
      debugPrint('no image selected');
    }
  }

  selectDateTime(context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      currentDate = pickedDate;
      dateController.text = DateFormat('dd/MM/yyyy').format(currentDate);
      emit(SelectDateTime());
    }
  }

  bool taskValidation() {
    if (pickedFilename.isEmpty) {
      getToastMessage(message: "please select image");
      return false;
    } else if (titleController.text.isEmpty) {
      getToastMessage(message: "please add title");
      return false;
    } else if (descriptionController.text.isEmpty) {
      getToastMessage(message: "please add description");
      return false;
    } else
      return true;
  }

  addTask() async {
    try {
      emit(AddNewTaskLoadingState());
      dio.Response response = await DioHelper.postData(
          url: StringManager.logic.kCreateEndPoint,
          data: {
            StringManager.logic.kImage: pickedFilename,
            StringManager.logic.kTitle: titleController.text,
            StringManager.logic.kDescription: descriptionController.text,
            StringManager.logic.kPriority:
                prioritySelectedValue, //low , medium , high
            StringManager.logic.kDueDate:
                DateFormat("YYYY-MM-DD").format(currentDate)
          });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        emit(AddNewTaskSuccessState());
        getToastMessage(message: "task added successfully");
      } else {
        emit(AddNewTaskErrorState());
        getToastMessage(message: "could not add the task, try again.");
      }
    } catch (error) {
      emit(AddNewTaskErrorState());
      getToastMessage(message: "could not add the task, try again.");

      debugPrint(error.toString());
    }
    Get.back();
  }
  addTaskProcess(){
    if(taskValidation()){
      addTask();
    }

  }


}
