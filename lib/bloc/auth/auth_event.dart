part of 'auth_bloc.dart';

sealed class AuthEvent {}

final class LoginRequest extends AuthEvent {
  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password,
  });
}

final class SignUpRequest extends AuthEvent {
  final String email;
  final String password;
  final String confirmPassword;

  SignUpRequest({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}

final class CreateProfile extends AuthEvent {
  final UserModel user;
  CreateProfile(this.user);
}
