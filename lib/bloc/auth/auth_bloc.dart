import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:equran/service/login/loginservice.dart';
import 'package:equran/service/user/userservice.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  SharedPreferences? prefs;
  LoginService loginService;
  UserService userService;

  AuthBloc({required this.loginService, required this.userService})
      : super(AuthLoading());

  AuthState get initialState => AuthInitialState();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    prefs = await SharedPreferences.getInstance();

    bool isInstalled = prefs!.containsKey("isInstalled");
    bool hasToken = await loginService.hasToken();
    String? userId, username, email;

    if (event is AppStarted) {
      if (isInstalled) {
        yield UnAuthenticatedState();
        if (hasToken) {
          userId = prefs!.getString("userId");
          username = prefs!.getString("username");
          email = prefs!.getString("email");
          yield AuthenticatedState(
            userId: userId,
            username: username,
            email: email,
          );
          print("hasToken");
        }
      } else {
        yield AuthInitialState();
      }
    }

    if (event is GetStartedButton) {
      prefs!.setString("isInstalled", event.isInstalled.toString());
      yield UnAuthenticatedState();
    }

    if (event is LoginPressButton) {
      try {
        yield AuthLoading();

        if (event.email != "" && event.password != "") {
          final responseData = await loginService.login(
            email: event.email,
            password: event.password,
          );

          if (responseData.token != null) {
            final responseUserData = await userService.getUser(
              id: 1,
            );

            int userLength = responseUserData.data!.length;
            List<int>? idList = [];
            List<String>? usernameList = [];
            List<String>? emailList = [];

            for (int i = 0; i < userLength; i++) {
              idList.add(responseUserData.data!.elementAt(i).id!);
              usernameList.add(
                  responseUserData.data!.elementAt(i).first_name.toString());
              emailList
                  .add(responseUserData.data!.elementAt(i).email.toString());
            }

            if (emailList.contains(event.email)) {
              var index = emailList.indexOf(event.email!);

              prefs!.setString("userId",
                  responseUserData.data!.elementAt(index).id.toString());
              prefs!.setString(
                  "username",
                  responseUserData.data!
                      .elementAt(index)
                      .first_name
                      .toString());
              prefs!.setString("email",
                  responseUserData.data!.elementAt(index).email.toString());

              userId = prefs!.getString("userId");
              username = prefs!.getString("username");
              email = prefs!.getString("email");
            }

            yield AuthenticatedState(
              userId: userId,
              username: username,
              email: email,
            );
          } else {
            yield AuthError(error: responseData.toString());
            yield UnAuthenticatedState();
          }
        } else {
          yield AuthError(error: "Please fill in username and password");
          yield UnAuthenticatedState();
        }
      } catch (error) {
        yield AuthError(error: error.toString());
        yield UnAuthenticatedState();
      }
    }

    if (event is LogoutPressButton) {
      await loginService.logout();
      yield UnAuthenticatedState();
    }
  }
}
