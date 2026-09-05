import '../models/login_result.dart';

sealed class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  const LoginSuccess(this.result);

  final LoginResult result;
}

class LoginFailure extends LoginState {
  const LoginFailure(this.error);

  final Object error;
}
