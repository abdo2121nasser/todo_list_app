import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:todo_list_app/recourses/manager_files/string_manager.dart';
import 'package:todo_list_app/recourses/manager_files/toast_massage_manager.dart';
import 'package:todo_list_app/recourses/models/profile_model/profile_model.dart';
import 'package:todo_list_app/recourses/services/dio_service.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);

  ProfileModel? profileModel;
  final profileBox = Hive.box(StringManager.logic.kProfileBox);
  final tokenBox = Hive.box(StringManager.logic.kTokenBox);

  getProfileModelData() async {
    ProfileModel? temp;
    temp = profileBox.get(StringManager.logic.kMyProfileModel);
    if (temp == null) {
      getUserData();
    } else {
      profileModel = temp;
    }
  }

  getUserData() async {
    if (isClosed) return;

    emit(GetUserDataLoadingState());
    String? token = await getAccessToken();
    if (token == null) {
      emit(GetUserDataErrorState());
      return;
    }

    try {
      var response = await DioHelper.getData(
          url: StringManager.logic.kProfileEndPoint, token: token);
      if (isClosed) return;
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        profileModel = ProfileModel.fromJson(response.data);
        saveProfileModelData(profileModel: profileModel!);
        emit(GetUserDataSuccessState());
      } else {
        getToastMessage(message: StringManager.ui.kError);
        emit(GetUserDataErrorState());
      }
    } catch (error) {
      if (isClosed) return;

      emit(GetUserDataErrorState());
      debugPrint(error.toString());
    }
  }

  saveProfileModelData({required ProfileModel profileModel}) {
    profileBox.put(StringManager.logic.kMyProfileModel, profileModel);
  }

  getAccessToken() async {
    try {
      String refreshToken = tokenBox.get(StringManager.logic.kRefreshToken);
      Response response = await DioHelper.getData(
          url: StringManager.logic.kRefreshTokenEndPoint+StringManager.logic.kRefreshTokenQuery + refreshToken);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        tokenBox.put(StringManager.logic.kAccessToken,
            response.data[StringManager.logic.kAccessToken]);
        print('access token');
        return  response.data[StringManager.logic.kAccessToken];
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
