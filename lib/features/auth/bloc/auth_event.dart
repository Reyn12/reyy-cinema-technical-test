sealed class AuthEvent {
  const AuthEvent();
}

class AuthCheckRequested extends AuthEvent {
  const AuthCheckRequested();
}

class AuthLoggedIn extends AuthEvent {
  const AuthLoggedIn();
}

class AuthLoggedOut extends AuthEvent {
  const AuthLoggedOut();
}
