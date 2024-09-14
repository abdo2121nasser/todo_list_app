part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class ChangeCurrentCategory extends HomeState {}
class IncrementCurrentPage extends HomeState {}

class GetTodoListLoadingState extends HomeState {}
class GetTodoListSuccessState extends HomeState {}
class GetTodoListErrorState extends HomeState {}

class GetMoreTodoListItemsLoadingState extends HomeState {}
class GetMoreTodoListItemsSuccessState extends HomeState {}
class GetMoreTodoListItemsErrorState extends HomeState {}
