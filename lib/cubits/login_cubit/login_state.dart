part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class ChangePasswordVisibilityState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  dio.Response<dynamic> response;
  LoginSuccessState({required this.response}) {
    saveTokens();
  }
  saveTokens() async {
    final tokenBox = Hive.box(StringManager.logic.kTokenBox);

    await tokenBox.put(StringManager.logic.kUserId,
        response.data[StringManager.logic.kUserId]);
    await tokenBox.put(StringManager.logic.kRefreshToken,
        response.data[StringManager.logic.kRefreshToken]);
    await tokenBox.put(StringManager.logic.kAccessToken,
        response.data[StringManager.logic.kAccessToken]);
  }
}

class LoginErrorState extends LoginState {}

class RefreshTokenLoadingState extends LoginState {}

class RefreshTokenSuccessState extends LoginState {
  dio.Response<dynamic> response;
  RefreshTokenSuccessState({required this.response}) {
    saveAccessToken();
  }
  saveAccessToken() async {
    final tokenBox = Hive.box(StringManager.logic.kTokenBox);
    await tokenBox.put(StringManager.logic.kAccessToken,
        response.data[StringManager.logic.kAccessToken]);
  }
}

class RefreshTokenFailedState extends LoginState {}

class RefreshTokenErrorState extends LoginState {}
