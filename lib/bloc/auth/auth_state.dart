part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final String message;

  AuthSuccess(this.message);
}

final class AuthFailure extends AuthState {
  final String error;

  AuthFailure(this.error);
}
