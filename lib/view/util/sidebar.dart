import 'package:equran/bloc/home/home_bloc.dart';
import 'package:equran/view/home/homeview.dart';
import 'package:equran/view/login/loginview.dart';
import 'package:equran/view/onboard/onboardview.dart';
import 'package:equran/view/qibla/qiblaview.dart';
import 'package:equran/view/util/contants/contants.dart';
import 'package:equran/view/util/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'package:equran/bloc/auth/auth_bloc.dart';
import 'package:equran/view/util/contants/color.dart';

class SideBarWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldSideKey = GlobalKey<ScaffoldState>();

  late double headerHeight,
      headerWidth,
      menuHeight,
      menuWidth,
      buttonWidth,
      loginHeight,
      signupHeight,
      logoutHeight;

  @override
  Widget build(BuildContext context) {
    heightSize = MediaQuery.of(context).size.height;
    widthSize = MediaQuery.of(context).size.width;

    shortestSide = MediaQuery.of(context).size.shortestSide;
    isMobile = shortestSide < 600.0;
    orientation = MediaQuery.of(context).orientation;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          SmartDialog.showLoading();
        } else {
          SmartDialog.dismiss();
        }

        if (state is AuthError) {
          SmartDialog.showToast(state.error.toString());
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          print("HomeState sidebar view: ${state}");
          if (state is QiblaOpenState) {
            return QiblaView();
          }

          return BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              print("AuthState sidebar view: ${state}");
              if (state is AuthenticatedState) {
                var username = state.username;
                var email = state.email;

                return body(context, state, username!, email!);
              }

              return body(context, state, " ", " ");
            },
          );
        },
      ),
    );

    /* BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          print("AuthState sidebar view: ${state}");
          if (state is AuthenticatedState) {
            var username = state.username;
            var email = state.email;

            return body(context, state, username!, email!);
          }

          return body(context, state, " ", " ");
        },
      ),
    ); */
  }

  responsiveLayout() {
    if (orientation == Orientation.portrait) {
      //Header size
      headerHeight = (isMobile == true) ? heightSize * 0.25 : heightSize * 0.25;

      //List menu size
      menuHeight = (isMobile == true) ? heightSize * 0.08 : heightSize * 0.25;

      //Button size
      buttonWidth = (isMobile == true) ? widthSize * 1.0 : widthSize * 0.25;
      loginHeight = (isMobile == true) ? heightSize * 0.06 : heightSize * 0.25;
      signupHeight = (isMobile == true) ? heightSize * 0.06 : heightSize * 0.25;
      logoutHeight = (isMobile == true) ? heightSize * 0.06 : heightSize * 0.25;
    }
  }

  body(context, state, String username, String email) {
    responsiveLayout();

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: lightMode),
      child: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            headerSection(username, email),
            //divider(),
            listMenuSection(
              iconPath: "lib/assets/icon/quran.png",
              text: 'Al-Quran',
              onTap: () {
                /* BlocProvider.of<AuthBloc>(context).add(
                  LogoutPressButton(),
                ); */
              },
            ),
            listMenuSection(
              iconPath: "lib/assets/icon/qibla.png",
              text: 'Qibla',
              onTap: () {
                BlocProvider.of<HomeBloc>(context).add(
                  Qibla(),
                );
              },
            ),
            listMenuSection(
              iconPath: "lib/assets/icon/mosque.png",
              text: 'Prayer Time',
              onTap: () {
                /* BlocProvider.of<AuthBloc>(context).add(
                  LogoutPressButton(),
                ); */
              },
            ),
            listMenuSection(
              iconPath: "lib/assets/icon/calendarislamic.png",
              text: 'Islamic Calendar',
              onTap: () {
                /* BlocProvider.of<AuthBloc>(context).add(
                  LogoutPressButton(),
                ); */
              },
            ),
            listMenuSection(
              iconPath: "lib/assets/icon/zakat.png",
              text: 'Calculator',
              onTap: () {
                /* BlocProvider.of<AuthBloc>(context).add(
                  LogoutPressButton(),
                ); */
              },
            ),
            /* loginSection(),
            signupSection(), */
            Container(
              child: state == UnAuthenticatedState()
                  ? Column(
                      children: [
                        loginSection(context),
                        signupSection(),
                      ],
                    )
                  : Column(
                      children: [
                        logoutSection(context),
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }

  Container headerSection(username, email) {
    return Container(
      height: headerHeight,
      child: UserAccountsDrawerHeader(
        decoration: const BoxDecoration(
          /* image: DecorationImage(
            fit: BoxFit.none,
            image: AssetImage('lib/assets/icon/onboard.jpg'),
            scale: 15.0,
          ), */
          color: Colors.white,
        ),
        accountName: Text(
          username,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        accountEmail: Text(
          email,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Container listMenuSection(
      {String? iconPath,
      Color? iconColor,
      String? text,
      GestureTapCallback? onTap}) {
    return Container(
      height: menuHeight,
      child: ListTile(
        title: Row(
          children: <Widget>[
            Image(
              image: AssetImage(iconPath.toString()),
              //color: darkPurple,
              height: menuHeight * 0.50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: SizedBox(
                height: menuHeight * 0.27,
                child: FittedBox(
                  child: Text(
                    text!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }

  Container loginSection(context) {
    return Container(
      height: loginHeight,
      width: buttonWidth,
      margin: EdgeInsets.only(
        top: heightSize * 0.10,
        bottom: heightSize * 0.02,
      ),
      child: ElevatedButton(
        child: SizedBox(
          height: loginHeight * 0.38,
          child: const FittedBox(
            child: Text('Login'),
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          elevation: MaterialStateProperty.all(10),
          backgroundColor: MaterialStateProperty.all(primaryColor),
        ),
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginView()),
          );
        },
      ),
    );
  }

  Container signupSection() {
    return Container(
      height: loginHeight,
      width: buttonWidth,
      child: ElevatedButton(
        child: SizedBox(
          height: loginHeight * 0.38,
          child: const FittedBox(
            child: Text('Sign Up'),
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          elevation: MaterialStateProperty.all(10),
          backgroundColor: MaterialStateProperty.all(primaryColor),
        ),
        onPressed: () {},
      ),
    );
  }

  Container logoutSection(context) {
    return Container(
      height: loginHeight,
      width: buttonWidth,
      margin: EdgeInsets.only(top: heightSize * 0.15),
      child: ElevatedButton(
        child: SizedBox(
          height: loginHeight * 0.38,
          child: const FittedBox(
            child: Text('Logout'),
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          elevation: MaterialStateProperty.all(10),
          backgroundColor: MaterialStateProperty.all(primaryColor),
        ),
        onPressed: () {
          BlocProvider.of<AuthBloc>(context).add(
            LogoutPressButton(),
          );
        },
      ),
    );
  }

  Divider divider() {
    return Divider(
      color: Colors.grey[100],
      thickness: 2,
    );
  }
}
