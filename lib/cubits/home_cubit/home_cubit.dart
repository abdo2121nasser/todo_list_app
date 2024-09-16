import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:todo_list_app/recourses/manager_files/string_manager.dart';
import 'package:todo_list_app/recourses/models/item_model.dart';
import 'package:todo_list_app/recourses/services/dio_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  List<ItemModel> todoListModels = [];
  List<ItemModel> todoListInProgressModels = [];
  List<ItemModel> todoListWaitingModels = [];
  List<ItemModel> todoListFinishedModels = [];
  int currentCategory = 0;
  int currentPage = 1;
  bool isFullTodoList = false;
  final List<String> categories = [
    StringManager.ui.kAllWord,
    StringManager.ui.kInProgressWord,
    StringManager.ui.kWaitingWord,
    StringManager.ui.kFinishedWord,
  ];

  changeCurrentCategory({required int index}) {
    currentCategory = index;
    emit(ChangeCurrentCategory());
  }

  incrementCurrentPage() {
    currentPage++;
    emit(IncrementCurrentPage());
  }

  String _getAccessToken() {
    final tokenBox = Hive.box(StringManager.logic.kTokenBox);
    return tokenBox.get(StringManager.logic.kAccessToken);
  }

  filterModels({required ItemModel item}) {
    switch (item.status) {
      case 'inProgress':
        todoListInProgressModels.add(item);
        return;
      case 'waiting':
        todoListWaitingModels.add(item);
        return;
      case 'Finished':
        todoListFinishedModels.add(item);
        return;
    }
  }

  getTodoModel() {
    switch (currentCategory) {
      case 0:
        return todoListModels;
      case 1:
        return todoListInProgressModels;
      case 2:
        return todoListWaitingModels;
      case 3:
        return todoListFinishedModels;
    }
  }

  getTodoList() async {
    todoListModels.clear();
    isFullTodoList = false;
    currentPage = 1;
    emit(GetTodoListLoadingState());
    try {
      Response response = await DioHelper.getData(
          url: StringManager.logic.kTodoEndPoint +
              StringManager.logic.kPageQuery +
              currentPage.toString(),
          token: _getAccessToken());

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        todoListModels = (response.data as List).map((task) {
          var temp = ItemModel.fromJson(task);
          filterModels(item: temp);
          return temp;
        }).toList();
        sort();
        emit(GetTodoListSuccessState());
      } else {
        emit(GetTodoListErrorState());
        debugPrint(response.statusMessage.toString());
      }
    } catch (error) {
      emit(GetTodoListErrorState());
      debugPrint(error.toString());
    }
  }

  getMoreTodoListItems() async {
    if (isFullTodoList) return;
    incrementCurrentPage();
    emit(GetMoreTodoListItemsLoadingState());

    try {
      Response response = await DioHelper.getData(
          url: StringManager.logic.kTodoEndPoint +
              StringManager.logic.kPageQuery +
              currentPage.toString(),
          token: _getAccessToken());

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        List<ItemModel> temp = (response.data as List).map((task) {
          var item = ItemModel.fromJson(task);
          filterModels(item: item);
          return item;
        }).toList();
        if (temp.isEmpty) {
          isFullTodoList = true;
        }
        todoListModels.addAll(temp);
        sort();
        emit(GetMoreTodoListItemsSuccessState());
      } else {
        emit(GetMoreTodoListItemsErrorState());
        debugPrint(response.statusMessage.toString());
      }
    } catch (error) {
      emit(GetMoreTodoListItemsErrorState());
      debugPrint(error.toString());
    }
  }

  sortItems({required List<ItemModel> items}) {
    const priorityOrder = {'high': 1, 'medium': 2, 'low': 3};
    items.sort((a, b) {
      int priorityA = priorityOrder[a.priority.toLowerCase()] ??
          4; // Default to 4 for unknown priority
      int priorityB = priorityOrder[b.priority.toLowerCase()] ?? 4;

      return priorityA.compareTo(priorityB);
    });
    return items;
  }

  sort() {
    todoListModels = sortItems(items: todoListModels);
    todoListInProgressModels = sortItems(items: todoListInProgressModels);
    todoListWaitingModels = sortItems(items: todoListWaitingModels);
    todoListFinishedModels = sortItems(items: todoListFinishedModels);
  }
}
