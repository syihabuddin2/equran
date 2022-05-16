import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:equran/model/meta/metamodel.dart';
import 'package:equran/model/page/pagemodel.dart';
import 'package:equran/model/surah/surahmodel.dart';
import 'package:equran/service/meta/metaservice.dart';
import 'package:equran/service/page/pageservice.dart';
import 'package:equran/service/surah/surahservice.dart';
import 'package:equran/view/util/contants/color.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  SurahService surahService;
  PageService pageService;
  MetaService metaService;

  HomeBloc({
    required this.surahService,
    required this.pageService,
    required this.metaService,
  }) : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeStarted) {
      try {
        yield HomeInitial();
        yield HomeLoading();

        final responseGetAllSurah = await surahService.getAll();
        final responseGetAllPage = await pageService.getAll(
          number: 2,
        );
        final responseGetMeta = await metaService.getAll();

        if (responseGetAllSurah.status != null ||
            responseGetAllSurah.status == "OK") {
          yield HomeSuccess(
            /* theme: lightMode,
            iconPath: "lib/assets/icon/drawer.png",
            iconHeight: 0.55,
            title: "Quran App", */
            getAllSurah: responseGetAllSurah,
            getAllPage: responseGetAllPage,
            getAllMeta: responseGetMeta,
          );
        } else {
          yield HomeError(error: responseGetAllSurah.status.toString());
        }
      } catch (error) {
        yield HomeError(error: error.toString());
      }
    }

    if (event is Qibla) {
      yield HomeInitial();
      yield HomeLoading();

      yield QiblaOpenState();
    }

    if (event is LoginOpenEvent) {
      yield HomeInitial();
      yield HomeLoading();

      yield LoginOpenState();

      /* yield LoginOpenState(
        theme: lightMode,
        iconPath: "lib/assets/icon/previous.png",
        iconHeight: 0.40,
        title: " ",
      ); */
    }

    /* if (event is LoginCloseEvent) {
      try {
        yield HomeInitial();
        yield HomeLoading();

        final responseGetAllSurah = await surahService.getAll();
        final responseGetAllPage = await pageService.getAll(
          number: 2,
        );
        final responseGetMeta = await metaService.getAll();

        if (responseGetAllSurah.status != null ||
            responseGetAllSurah.status == "OK") {
          yield HomeSuccess(
            getAllSurah: responseGetAllSurah,
            getAllPage: responseGetAllPage,
            getAllMeta: responseGetMeta,
          );
        } else {
          yield HomeError(error: responseGetAllSurah.status.toString());
        }
      } catch (error) {
        yield HomeError(error: error.toString());
      }
    } */
  }
}
