import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:todo_list_app/recourses/manager_files/string_manager.dart';
import 'package:todo_list_app/recourses/manager_files/toast_massage_manager.dart';
import 'package:todo_list_app/recourses/services/dio_service.dart';
import 'package:todo_list_app/screens/home_screen/home_screen.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  String countryCode = '+1';
  bool isVisiblePassword = true;

  changePasswordVisibility() {
    isVisiblePassword = !isVisiblePassword;
    emit(ChangePasswordVisibilityState());
  }

  bool isPhoneValid() {
    PhoneNumber p = PhoneNumber.fromCompleteNumber(completeNumber: phone.text);
    p.isValidNumber();
    if (p.isValidNumber()) {
      getToastMessage(message: StringManager.ui.kPhoneNumberInValid);
      return false;
    }
    return true;
  }

  bool passwordValidation() {
    if (!password.text.isNotEmpty) {
      getToastMessage(message: StringManager.ui.kPasswordIsEmpty);
      return false;
    } else if (password.text.length < 6) {
      getToastMessage(message: StringManager.ui.kPasswordLengthError);
      return false;
    }
    return true;
  }

  Map<String, dynamic> get _loginData {
    return {
      StringManager.logic.kPhoneNumber: '+$countryCode${phone.text}',
      StringManager.logic.kPassword: password.text,
    };
  }
  _refreshToken() async {
    try {
      emit(RefreshTokenLoadingState());
      var response = await DioHelper.postData(
          url: StringManager.logic.kLoginEndPoint, data: _loginData);
      if (response.statusCode == 200) {
        emit(RefreshTokenSuccessState(response: response));
      } else if (response.statusCode == 403) {
        emit(RefreshTokenFailedState());
      }
    } catch (error) {
      emit(RefreshTokenErrorState());
      debugPrint(error.toString());
    }
  }
  login() async {
    emit(LoginLoadingState());
    try {
      var response = await DioHelper.postData(
          url: StringManager.logic.kLoginEndPoint, data: _loginData);
      if (response.statusCode! >= 200 && response.statusCode! <300) {
        emit(LoginSuccessState(response: response));
        Get.to(()=>const HomeScreen());
      }
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 401) {
        await _refreshToken();
      }
    } catch (error) {
      emit(LoginErrorState());
getToastMessage(message: StringManager.ui.kError);
      debugPrint(error.toString());
    }
  }

  loginProcess() {
    if (isPhoneValid() && passwordValidation()) {
      login();
    }
  }


}
