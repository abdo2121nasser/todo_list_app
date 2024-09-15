part of 'add_new_task_cubit.dart';

@immutable
abstract class AddNewTaskState {}

class AddNewTaskInitial extends AddNewTaskState {}
class ChangePrioritySelectedValue extends AddNewTaskState {}
class SelectDateTime extends AddNewTaskState {}

class PickImageLoadingState extends AddNewTaskState {}
class PickImageSuccessState extends AddNewTaskState {}
class PickImageEmptyState extends  AddNewTaskState {}

class AddNewTaskLoadingState extends AddNewTaskState {}
class AddNewTaskSuccessState extends AddNewTaskState {}
class AddNewTaskErrorState extends  AddNewTaskState {}
