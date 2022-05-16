part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthUnInitialState extends AuthState {}

class AuthenticatedState extends AuthState {
  String? userId;
  String? username;
  String? email;

  AuthenticatedState({
    this.userId,
    this.username,
    this.email,
  });
}

class UnAuthenticatedState extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String error;

  AuthError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'AuthError { error: $error }';
}
