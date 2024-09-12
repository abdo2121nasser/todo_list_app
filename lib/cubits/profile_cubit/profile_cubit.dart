import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:todo_list_app/recourses/manager_files/string_manager.dart';
import 'package:todo_list_app/recourses/manager_files/toast_massage_manager.dart';
import 'package:todo_list_app/recourses/models/profile_model.dart';
import 'package:todo_list_app/recourses/services/dio_service.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);

  ProfileModel? profileModel;

  Future<String?> _getAccessToken() async {
    try {
      FlutterSecureStorage secureStorage = const FlutterSecureStorage();
      return await secureStorage.read(key: StringManager.logic.kAccessToken);
    } catch (error) {
      debugPrint(error.toString());
    }
    return null;
  }

  getUserData() async {
    if(isClosed) return;

    emit(GetUserDataLoadingState());
    String? token = await _getAccessToken();
    if (token == null) return;
    token =
'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjQ5ZmIyZWVmMGJmOTNkZDAwNzExYmEiLCJpYXQiOjE3MjYxNzE4NDIsImV4cCI6MTcyNjE3MjQ0Mn0.u39A-fMgbt5muxv8VrK4ZBP2E0s1qMpqlUI3OhzZ5Zs';
    try {
      var response = await DioHelper.getData(
          url: StringManager.logic.kProfileEndPoint, token: token);
      if(isClosed) return;
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        profileModel = ProfileModel.fromJson(response.data);
        emit(GetUserDataSuccessState());
      }
      else{
        getToastMessage(message: StringManager.ui.kError);
        emit(GetUserDataErrorState());
      }
    } catch (error) {
      if(isClosed) return;

      emit(GetUserDataErrorState());
      debugPrint(error.toString());
    }
  }
}
