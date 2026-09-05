import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../network/api_service.dart';
import '../storage/auth_storage.dart';
import 'auth_bloc.dart';
import 'auth_event.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required ApiService apiService,
    required AuthBloc authBloc,
    AuthStorage? authStorage,
  }) : _apiService = apiService,
       _authBloc = authBloc,
       _authStorage = authStorage ?? AuthStorage(),
       super(const LoginInitial()) {
    on<LoginSubmitted>(onSubmitted);
  }

  final ApiService _apiService;
  final AuthBloc _authBloc;
  final AuthStorage _authStorage;

  Future<void> onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginLoading());
    try {
      final result = await _apiService.login(
        username: event.username,
        password: event.password,
        mock: true,
      );
      await _authStorage.saveLogin(result);
      _authBloc.add(const AuthLoggedIn());
      emit(LoginSuccess(result));
    } catch (error) {
      emit(LoginFailure(error));
    }
  }
}
