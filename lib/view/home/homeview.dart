import 'package:equran/bloc/auth/auth_bloc.dart';
import 'package:equran/bloc/home/home_bloc.dart';
import 'package:equran/model/meta/metamodel.dart';
import 'package:equran/model/surah/surahmodel.dart';
import 'package:equran/view/login/loginview.dart';
import 'package:equran/view/util/contants/color.dart';
import 'package:equran/view/util/contants/contants.dart';
import 'package:equran/view/util/sidebar.dart';
import 'package:equran/view/util/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldHomeKey = GlobalKey<ScaffoldState>();

  late double salamHeight,
      salamWidth,
      nameHeight,
      nameWidth,
      lastReadHeight,
      lastReadWidth,
      tabCHeight,
      tabCWidth,
      tabCTop,
      tabBarHeight,
      listHeight,
      listWidth,
      listTop;

  late double shortestSide;

  late bool isMobile;

  late Orientation orientation;

  @override
  Widget build(BuildContext context) {
    statusBarHeight = MediaQuery.of(context).viewPadding.top;

    var appBar = TopBar();
    double appBarHeight = appBar.preferredSize.height;

    heightSize =
        MediaQuery.of(context).size.height - statusBarHeight - appBarHeight;
    widthSize = MediaQuery.of(context).size.width;

    shortestSide = MediaQuery.of(context).size.shortestSide;
    isMobile = shortestSide < 600.0;
    orientation = MediaQuery.of(context).orientation;

    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeLoading) {
          SmartDialog.showLoading();
        } else {
          SmartDialog.dismiss();
        }

        if (state is HomeError) {
          SmartDialog.showToast(state.error.toString());
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          print("HomeState view: ${state}");
          if (state is HomeSuccess) {
            var getAllSurah = state.getAllSurah;
            var getAllMeta = state.getAllMeta;

            return Scaffold(
              backgroundColor: lightMode,
              key: scaffoldHomeKey,
              appBar: TopBar(
                theme: lightMode,
                iconPath: "lib/assets/icon/drawer.png",
                iconHeight: 0.55,
                title: "Quran App",
                onTap: () {
                  scaffoldHomeKey.currentState!.openDrawer();
                },
              ),
              drawer: SideBarWidget(),
              body: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  print("AuthState view: ${state}");
                  if (state is AuthenticatedState) {
                    var username = state.username;

                    return body(context, getAllSurah!, getAllMeta!, username!,
                        orientation);
                  }

                  return body(
                      context, getAllSurah!, getAllMeta!, "Hello", orientation);
                },
              ),
            );
          }

          if (state is LoginOpenState) {
            return LoginView();
          }

          return Scaffold(
            //backgroundColor: textColor,
            key: scaffoldHomeKey,
            appBar: TopBar(
              theme: lightMode,
              iconPath: "lib/assets/icon/drawer.png",
              iconHeight: 0.55,
              title: "Quran App",
              onTap: () {
                scaffoldHomeKey.currentState!.openDrawer();
              },
            ),
            drawer: SideBarWidget(),
            //body: body(context, state, orientation),
          );
        },
      ),
    );
  }

  body(context, Surah surah, MetaModel meta, String username,
      Orientation orientation) {
    if (orientation == Orientation.portrait) {
      //Salam size
      salamHeight = heightSize * 0.08;
      salamWidth = widthSize * 0.90;

      //Name size
      nameHeight = heightSize * 0.08;
      nameWidth = widthSize * 0.90;

      //Last read size
      lastReadHeight = heightSize * 0.20;
      lastReadWidth = widthSize * 0.90;

      //Tab bar size
      tabCTop = heightSize * 0.02;
      tabCHeight = heightSize * 0.62;
      tabCWidth = widthSize * 0.90;

      //Tab bar size
      tabBarHeight = tabCHeight * 0.08;

      //List size
      listHeight = tabCHeight - tabBarHeight;
    } /*  else {
      //Title size
      salamLeft = _heightSize * 1.0;
      salamLeft = _widthSize * 1.0;

      //Description size
      descTop = _heightSize * 1.0;
      descBottom = _widthSize * 1.0;

      //Image size
      imgLeft = _heightSize * 1.0;
      imgWidth = _widthSize * 1.0;
    } */

    return Center(
      child: Column(
        children: [
          salam(),
          name(username),
          lastRead(),
          tabBar(surah, meta),
        ],
      ),
    );
  }

  Container salam() {
    return Container(
      height: salamHeight,
      width: salamWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          SizedBox(
            height: salamHeight * 0.45,
            child: const FittedBox(
              child: Text(
                "Assalamualaikum",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container name(username) {
    return Container(
      height: nameHeight,
      width: nameWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: nameHeight * 0.50,
            child: FittedBox(
              child: Text(
                username,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Color.fromARGB(255, 50, 45, 59),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container lastRead() {
    return Container(
      height: lastReadHeight,
      width: lastReadWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            lightPurple,
            primaryColor,
          ],
        ),
      ), // BoxDecoration
    );
  }

  Container tabBar(Surah surah, MetaModel meta) {
    return Container(
      margin: EdgeInsets.only(top: tabCTop),
      //color: Colors.purple,
      height: tabCHeight,
      width: tabCWidth,
      child: DefaultTabController(
        length: 4, // length of tabs
        initialIndex: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: tabBarHeight,
              child: const TabBar(
                labelColor: Colors.deepPurple,
                unselectedLabelColor: Colors.black,
                indicatorColor: Colors.deepPurple,
                tabs: [
                  Tab(text: 'Surah'),
                  Tab(text: 'Page'),
                  Tab(text: 'Juz'),
                  Tab(text: 'Hizb'),
                ],
              ),
            ),
            SizedBox(
              height: listHeight,
              //height: listCHeight,
              //color: Colors.green, //height of TabBarView
              /* decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey, width: 0.5),
                ),
              ), */
              child: TabBarView(
                children: <Widget>[
                  Center(
                    child: surahList(surah),
                  ),
                  Center(
                    child: pageList(meta),
                  ),
                  Container(
                    child: juzList(meta),
                  ),
                  Container(
                    child: surahList(surah),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView surahList(Surah surah) {
    return ListView.builder(
      itemCount: surah.data!.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              onTap: () {
                SmartDialog.showToast(surah.data![index].number.toString());
                /* Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailSurahView()),
                ); */
              },
              leading: Container(
                height: 45,
                width: 45,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/assets/icon/octagonal.png"),
                  ),
                ),
                child: Center(
                  child: Text(
                    "${surah.data![index].number}",
                    style: const TextStyle(
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
              /* leading: Text(
                '${surah.data![index].number}',
              ), */
              title: Text(
                '${surah.data![index].englishName}',
                style: const TextStyle(
                  color: Color(0XFF260F68),
                ),
              ),
              subtitle: Text(
                '${surah.data![index].revelationType} - ${surah.data![index].numberOfAyahs} verses',
                style: const TextStyle(
                  color: Color.fromARGB(255, 168, 167, 168),
                ),
              ),
              trailing: SizedBox(
                height: tabCHeight * 0.08,
                child: FittedBox(
                  child: Text(
                    '${surah.data![index].name}',
                    style: const TextStyle(
                      color: Color(0XFF9345F2),
                      fontFamily: 'Noorehidayat',
                    ),
                  ),
                ),
              ),
            ),
            Divider(height: 25, thickness: 2, color: Colors.grey[300]),
          ],
        );
      },
    );
  }

  ListView pageList(MetaModel meta) {
    print("itemCount ${meta.data!.pages!.references!.length}");
    return ListView.builder(
      itemCount: meta.data!.pages!.count,
      itemBuilder: (context, index) {
        var pageNumber = index + 1;
        var surahNumber = meta.data!.pages!.references![index].surah;
        var ayahNumber = meta.data!.pages!.references![index].ayah;
        var surahName =
            meta.data!.surahs!.references![surahNumber! - 1].englishName;
        var arabic = meta.data!.surahs!.references![index].name;

        /* BlocProvider.of<HomeBloc>(context).add(
          HomeStarted(
            number: 2,
          ),
        ); */

        return Column(
          children: [
            ListTile(
              title: Text(
                'Page ${pageNumber}',
                style: const TextStyle(
                  color: Color(0XFF260F68),
                ),
              ),
              subtitle: Text(
                '${surahName} ${surahNumber}:${ayahNumber}',
                style: const TextStyle(
                  color: Color.fromARGB(255, 168, 167, 168),
                ),
              ),
              trailing: SizedBox(
                height: tabCHeight * 0.08,
                child: FittedBox(
                  child: Text(
                    '${arabic}',
                    style: const TextStyle(
                      color: Color(0XFF9345F2),
                      fontFamily: 'Noorehidayat',
                    ),
                  ),
                ),
              ),
            ),
            Divider(height: 25, thickness: 2, color: Colors.grey[300]),
          ],
        );
      },
    );
  }

  ListView juzList(MetaModel meta) {
    return ListView.builder(
      itemCount: meta.data!.juzs!.count,
      itemBuilder: (context, index) {
        var surahNumber = meta.data!.juzs!.references![index].surah;
        var ayah = meta.data!.juzs!.references![index].ayah;
        var surahName =
            meta.data!.surahs!.references![surahNumber! - 1].englishName;
        var arabic = meta.data!.surahs!.references![index].name;

        return Column(
          children: [
            ListTile(
              title: Text(
                'Juz ${index + 1}',
                style: const TextStyle(
                  color: Color(0XFF260F68),
                ),
              ),
              subtitle: Text(
                '${surahName} ${surahNumber}:${ayah}',
                style: const TextStyle(
                  color: Color.fromARGB(255, 168, 167, 168),
                ),
              ),
              trailing: SizedBox(
                height: tabCHeight * 0.08,
                child: FittedBox(
                  child: Text(
                    '${arabic}',
                    style: const TextStyle(
                      color: Color(0XFF9345F2),
                      fontFamily: 'Noorehidayat',
                    ),
                  ),
                ),
              ),
            ),
            Divider(height: 25, thickness: 2, color: Colors.grey[300]),
          ],
        );
      },
    );
  }
}
