import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../network/api_service.dart';
import '../storage/auth_storage.dart';
import 'auth_bloc.dart';
import 'auth_event.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required this.apiService,
    required this.authBloc,
    AuthStorage? authStorage,
  }) : authStorage = authStorage ?? AuthStorage(),
       super(const LoginInitial()) {
    on<LoginSubmitted>(onSubmitted);
  }

  final ApiService apiService;
  final AuthBloc authBloc;
  final AuthStorage authStorage;

  Future<void> onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginLoading());
    try {
      final result = await apiService.login(
        username: event.username,
        password: event.password,
        mock: true,
      );
      await authStorage.saveLogin(result);
      authBloc.add(const AuthLoggedIn());
      emit(LoginSuccess(result));
    } catch (error) {
      emit(LoginFailure(error));
    }
  }
}
