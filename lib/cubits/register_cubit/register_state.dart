
part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class ChangePasswordVisibilityState extends RegisterState {}
class ChangeExperienceLevelState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}
class RegisterSuccessState extends RegisterState {
  dio.Response response ;
  RegisterSuccessState({required this.response}) {
    saveTokens();
  }
  saveTokens() async {
    FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    await secureStorage.write(
        key: StringManager.logic.kUserId,
        value: response.data[StringManager.logic.kUserId]);
    await secureStorage.write(
        key: StringManager.logic.kRefreshToken,
        value: response.data[StringManager.logic.kRefreshToken]);
    await secureStorage.write(
        key: StringManager.logic.kAccessToken,
        value: response.data[StringManager.logic.kAccessToken]);
  }
}
class RegisterErrorState extends RegisterState {}
