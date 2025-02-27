part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthAuthenticated extends AuthState {
  final String token;
  AuthAuthenticated(this.token);
}
class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}