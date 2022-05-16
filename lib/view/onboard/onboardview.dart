import 'package:equran/bloc/auth/auth_bloc.dart';
import 'package:equran/view/util/contants/color.dart';
import 'package:equran/view/util/contants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardView extends StatelessWidget {
  late double titleHeight,
      titleWidth,
      subTitleHeight,
      imgCHeight,
      imgCWidth,
      imgHeight,
      imgWidth,
      imgTop,
      imgBottom,
      getStartedTop,
      getStartedLeft,
      getStartedHeight,
      getStartedWidth;

  SharedPreferences? preferences;

  @override
  Widget build(BuildContext context) {
    statusBarHeight = MediaQuery.of(context).viewPadding.top;

    heightSize = MediaQuery.of(context).size.height - statusBarHeight;
    widthSize = MediaQuery.of(context).size.width;

    shortestSide = MediaQuery.of(context).size.shortestSide;
    isMobile = shortestSide < 600.0;
    orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      //backgroundColor: textColor,
      body: body(context, orientation),
    );
  }

  body(context, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      //Title size
      titleHeight = (isMobile == true) ? heightSize * 0.15 : heightSize * 0.10;
      titleWidth = widthSize * 1.0;

      //Sub Title size
      subTitleHeight =
          (isMobile == true) ? heightSize * 0.05 : heightSize * 0.10;

      //Image size
      imgCHeight = (isMobile == true) ? heightSize * 0.80 : heightSize * 0.8308;
      imgCWidth = widthSize * 1.0;
      imgHeight = (isMobile == true) ? heightSize * 0.56 : heightSize * 0.10;
      imgWidth = widthSize * 1.0;
      getStartedTop =
          (isMobile == true) ? heightSize * 0.59 : heightSize * 0.10;
      getStartedLeft =
          (isMobile == true) ? widthSize * 0.25 : heightSize * 0.10;
      getStartedHeight =
          (isMobile == true) ? heightSize * 0.07 : heightSize * 0.10;
      getStartedWidth =
          (isMobile == true) ? widthSize * 0.50 : heightSize * 0.10;
    } else {
      //Title size
      titleHeight = (isMobile == true) ? heightSize * 0.15 : heightSize * 0.10;
      titleWidth = widthSize * 1.0;

      //Sub Title size
      subTitleHeight =
          (isMobile == true) ? heightSize * 0.15 : heightSize * 0.10;

      //Image size
      imgCHeight = (isMobile == true) ? heightSize * 0.90 : heightSize * 0.8308;
      imgCWidth = widthSize * 1.0;
      imgHeight = (isMobile == true) ? heightSize * 0.70 : heightSize * 0.10;
      imgWidth = widthSize * 1.0;
      getStartedTop =
          (isMobile == true) ? heightSize * 0.70 : heightSize * 0.10;
      getStartedLeft =
          (isMobile == true) ? widthSize * 0.30 : heightSize * 0.10;
      getStartedHeight =
          (isMobile == true) ? heightSize * 0.12 : heightSize * 0.10;
      getStartedWidth =
          (isMobile == true) ? widthSize * 0.40 : heightSize * 0.10;
    }

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        ListView(
          children: [
            Column(
              children: <Widget>[
                title(),
                subTitle(subTitleHeight),
                onboardSection(context),
              ],
            ),
          ],
        )
      ],
    );
  }

  SizedBox title() {
    return SizedBox(
      height: titleHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          SizedBox(
            height: orientation == Orientation.portrait
                ? titleHeight * 0.35
                : titleHeight * 0.70,
            child: const FittedBox(
              child: Text(
                "Quran App",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: darkPurple,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'K2DMedium',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox subTitle(subTitleHeight) {
    return SizedBox(
      height: subTitleHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: subTitleHeight * 0.40,
            child: const FittedBox(
              child: Text(
                "Learn Quran And Recite Once Everyday",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container onboardSection(context) {
    return Container(
      height: imgCHeight,
      width: imgCWidth,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              height: imgHeight * 0.80,
              width: imgWidth,
              margin: EdgeInsets.only(top: imgHeight * 0.15),
              child: FittedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Lottie.asset('lib/assets/icon/lottiequran.json'),
                ),
              ),
            ),
          ),
          Positioned(
            top: getStartedTop,
            left: getStartedLeft,
            child: SizedBox(
              height: getStartedHeight,
              width: getStartedWidth,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(
                    const GetStartedButton(isInstalled: true),
                  );
                },
                padding: const EdgeInsets.all(10.0),
                color: orangeButton,
                textColor: textColor,
                child: SizedBox(
                  height: getStartedHeight * 0.33,
                  child: const FittedBox(
                    child: Text(
                      "Get Started",
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
