sealed class AuthEvent {
  const AuthEvent();
}

class AuthCheckRequested extends AuthEvent {
  const AuthCheckRequested();
}

class AuthOnboardingCompleted extends AuthEvent {
  const AuthOnboardingCompleted();
}

class AuthLoggedIn extends AuthEvent {
  const AuthLoggedIn();
}

class AuthLoggedOut extends AuthEvent {
  const AuthLoggedOut();
}
