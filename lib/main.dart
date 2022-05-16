import 'package:equran/bloc/auth/auth_bloc.dart';
import 'package:equran/bloc/home/home_bloc.dart';
import 'package:equran/service/login/loginservice.dart';
import 'package:equran/service/meta/metaservice.dart';
import 'package:equran/service/page/pageservice.dart';
import 'package:equran/service/surah/surahservice.dart';
import 'package:equran/service/user/userservice.dart';
import 'package:equran/view/home/homeview.dart';
import 'package:equran/view/onboard/onboardview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) {
            return AuthBloc(
              loginService: LoginService(),
              userService: UserService(),
            )..add(AppStarted());
          },
        ),
        BlocProvider<HomeBloc>(
          create: (context) {
            return HomeBloc(
              surahService: SurahService(),
              pageService: PageService(),
              metaService: MetaService(),
            )..add(HomeStarted());
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorObservers: [FlutterSmartDialog.observer],
        builder: FlutterSmartDialog.init(),
        /* theme: ThemeData(
          fontFamily: 'K2DRegular',
        ), */
        home: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          /* if (state is AuthInitialState) {
            return LoginView();
          } else if (state is UnAuthenticatedState) {
            return LoginView();
          } else if (state is AuthenticatedState) {
            return HomeView();
          } else {
            return LoginView();
          } */
          if (state is AuthInitialState) {
            return OnboardView();
          } else if (state is UnAuthenticatedState) {
            return HomeView();
          } else if (state is AuthenticatedState) {
            return HomeView();
          } else {
            return OnboardView();
          }
        }),
      ),
    );
  }
}
