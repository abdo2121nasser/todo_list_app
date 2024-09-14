import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_list_app/recourses/manager_files/string_manager.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  int currentCategory=0;
 final List<String> categories=[
   StringManager.ui.kAllWord,
   StringManager.ui.kInProgressWord,
   StringManager.ui.kWaitingWord,
   StringManager.ui.kFinishedWord,
 ];

 changeCurrentCategory({required int index}){
   currentCategory=index;
   emit(ChangeCurrentCategory());
 }







}
