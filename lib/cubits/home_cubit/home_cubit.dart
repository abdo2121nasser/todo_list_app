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
  int currentCategory = 0;
  int currentPage = 1;
  bool isFullTodoList=false;
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

  getTodoList() async {
    todoListModels.clear();
    isFullTodoList=false;
    currentPage = 1; // Reset page for new category or full reload
    emit(GetTodoListLoadingState());
    try {
      Response response = await DioHelper.getData(
          url: StringManager.logic.kTodoEndPoint +
              StringManager.logic.kPageQuery +
              currentPage.toString(),
          token: _getAccessToken());

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        todoListModels = (response.data as List)
            .map((task) => ItemModel.fromJson(task))
            .toList();
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
    if(isFullTodoList) return;
    incrementCurrentPage();
    emit(GetMoreTodoListItemsLoadingState());

    try {
      Response response = await DioHelper.getData(
          url: StringManager.logic.kTodoEndPoint +
              StringManager.logic.kPageQuery +
              currentPage.toString(),
          token: _getAccessToken());

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        List<ItemModel> temp = (response.data as List)
            .map((task) => ItemModel.fromJson(task))
            .toList();
        if(temp.isEmpty)
          {
            isFullTodoList=true;
          }
        todoListModels.addAll(temp);
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
}
