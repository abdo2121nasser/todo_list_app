import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:meta/meta.dart';
import 'package:todo_list_app/screens/authentication_screens/login_screen.dart';

import '../../recourses/manager_files/string_manager.dart';
import '../../recourses/manager_files/toast_massage_manager.dart';
import '../../recourses/services/dio_service.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();
  final List<String> experienceLevels = [
    StringManager.ui.kFreshWord,
    StringManager.ui.kJuniorWord,
    StringManager.ui.kMidLevelWord,
    StringManager.ui.kSeniorWord,
  ];
  String level = StringManager.ui.kFreshWord;
  bool isVisiblePassword = true;
  String countryCode = '+1';
  changePasswordVisibility() {
    isVisiblePassword = !isVisiblePassword;
    emit(ChangePasswordVisibilityState());
  }

  changeExperienceLevel({required String level}) {
    this.level = level;
    emit(ChangeExperienceLevelState());
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

  Map<String, dynamic> get _registerData {
    return {
      StringManager.logic.kPhoneNumber: '+$countryCode${phone.text}',
      StringManager.logic.kPassword: password.text,
      StringManager.logic.kName: name.text,
      StringManager.logic.kExperience: int.parse(experience.text),
      StringManager.logic.kAddress: address.text,
      StringManager.logic.kLevel: level
    };
  }

  register() async {
    try {
      emit(RegisterLoadingState());
      dio.Response response = await DioHelper.postData(
          url: StringManager.logic.kRegisterEndPoint, data: _registerData);
      emit(RegisterSuccessState(response: response));
      Get.offAll(const LoginScreen());
    } catch (error) {
      getToastMessage(message: StringManager.ui.kError);
      emit(RegisterErrorState());
      debugPrint(error.toString());
    }
  }

  registerProcess() {
    if (isPhoneValid() && passwordValidation()) {
      if (name.text.isNotEmpty &&
          experience.text.isNotEmpty &&
          address.text.isNotEmpty) {
        register();
      } else {
        getToastMessage(message: StringManager.ui.kSignUpEmptyFieldMessage);
      }
    }
  }
}
