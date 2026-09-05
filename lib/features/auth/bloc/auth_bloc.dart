import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/event_bus/app_event_bus.dart';
import '../../../core/event_bus/events/session_expired_event.dart';
import '../storage/auth_storage.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({AuthStorage? authStorage})
    : authStorage = authStorage ?? AuthStorage(),
      super(const AuthInitial()) {
    on<AuthCheckRequested>(onCheckRequested);
    on<AuthLoggedIn>(onLoggedIn);
    on<AuthLoggedOut>(onLoggedOut);

    sessionExpiredSubscription = AppEventBus.instance
        .on<SessionExpiredEvent>()
        .listen((_) => add(const AuthLoggedOut()));
  }

  final AuthStorage authStorage;
  late final StreamSubscription<SessionExpiredEvent> sessionExpiredSubscription;

  Future<void> onCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final hasToken = await authStorage.hasToken();
    emit(hasToken ? const AuthAuthenticated() : const AuthUnauthenticated());
  }

  void onLoggedIn(AuthLoggedIn event, Emitter<AuthState> emit) {
    emit(const AuthAuthenticated());
  }

  Future<void> onLoggedOut(AuthLoggedOut event, Emitter<AuthState> emit) async {
    await authStorage.clearLogin();
    emit(const AuthUnauthenticated());
  }

  @override
  Future<void> close() {
    sessionExpiredSubscription.cancel();
    return super.close();
  }
}
