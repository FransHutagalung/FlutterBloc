part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class SignIn extends AuthEvent {
  final String email;
  final String password;
  SignIn(this.email, this.password);
}

final class SignUp extends AuthEvent {
  final String email;
  final String password;
  SignUp(this.email, this.password);
}