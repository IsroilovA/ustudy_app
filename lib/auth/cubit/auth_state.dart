part of 'auth_cubit.dart';

@immutable
sealed class AuthState {
  final bool isLogin;
  const AuthState(this.isLogin);
}

final class AuthLoading extends AuthState {
  const AuthLoading(super.isLogin);
}

final class AuthLogin extends AuthState {
  const AuthLogin() : super(true);
}

final class AuthSighIn extends AuthState {
  const AuthSighIn() : super(false);
}

final class AuthError extends AuthState {
  final String? message;
  const AuthError(super.isLogin, this.message);
}
