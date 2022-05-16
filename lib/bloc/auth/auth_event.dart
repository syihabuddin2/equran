part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent {}

class GetStartedButton extends AuthEvent {
  final bool isInstalled;

  const GetStartedButton({
    required this.isInstalled,
  });

  @override
  List<Object> get props => [isInstalled];

  @override
  String toString() => 'GetStarted { isInstalled: $isInstalled}';
}

class LoginPressButton extends AuthEvent {
  String? email;
  String? password;

  LoginPressButton({this.email, this.password});

  @override
  List<Object> get props => [email!, password!];

  @override
  String toString() => 'Login { email: $email, password: $password}';
}

class LogoutPressButton extends AuthEvent {}
