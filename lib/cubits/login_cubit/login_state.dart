part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class ChangePasswordVisibilityState extends LoginState {}

class LoginLoadingState extends LoginState {}
class LoginSuccessState extends LoginState {
  Response<dynamic> response;
  LoginSuccessState({required this.response}) {
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
class LoginErrorState extends LoginState {}

class RefreshTokenLoadingState extends LoginState {}
class RefreshTokenSuccessState extends LoginState {
  Response<dynamic> response;
  RefreshTokenSuccessState({required this.response}) {
    saveAccessToken();
  }
  saveAccessToken() async {
    FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    await secureStorage.write(
        key: StringManager.logic.kAccessToken,
        value: response.data[StringManager.logic.kAccessToken]);
  }
}
class RefreshTokenFailedState extends LoginState {}
class RefreshTokenErrorState extends LoginState {}
