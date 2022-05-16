part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeStarted extends HomeEvent {
  int? number;

  HomeStarted({
    this.number,
  });

  @override
  List<Object> get props => [number!];

  @override
  String toString() => 'HomeStarted { number: $number}';
}

class Qibla extends HomeEvent {}

class LoginOpenEvent extends HomeEvent {}

class LoginCloseEvent extends HomeEvent {}
