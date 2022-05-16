part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeUninitializedState extends HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  final String error;

  HomeError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'HomeError { error: $error }';
}

class HomeSuccess extends HomeState {
  Color? theme;
  String? iconPath;
  double? iconHeight;
  String? title;
  //void onTap;
  Surah? getAllSurah;
  Data? getData;
  PageModel? getAllPage;
  MetaModel? getAllMeta;

  HomeSuccess({
    this.theme,
    this.iconPath,
    this.iconHeight,
    this.title,
    //this.onTap,
    this.getAllSurah,
    this.getData,
    this.getAllPage,
    this.getAllMeta,
  });
}

class LoginOpenState extends HomeState {
  Color? theme;
  String? iconPath;
  double? iconHeight;
  String? title;
  //void onTap;

  LoginOpenState({
    this.theme,
    this.iconPath,
    this.iconHeight,
    this.title,
    //this.onTap,
  });
}

class QiblaOpenState extends HomeState {}
