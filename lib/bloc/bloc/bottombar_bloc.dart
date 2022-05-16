import 'dart:async';

import 'package:bloc/bloc.dart';

part 'bottombar_event.dart';
part 'bottombar_state.dart';

class BottombarBloc extends Bloc<MyEvent, MyState> {
  BottombarBloc() : super(StateA());

  @override
  Stream<MyState> mapEventToState(
    MyEvent event,
  ) async* {
    switch (event) {
      case MyEvent.surahTab:
        yield StateA();
        break;
      case MyEvent.pageTab:
        yield StateB();
        break;
      case MyEvent.juzTab:
        yield StateB();
        break;
      case MyEvent.hizbTab:
        yield StateB();
        break;
    }
  }
}
