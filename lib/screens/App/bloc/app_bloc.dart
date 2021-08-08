import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dellyshop/Data/Repository/IRepository.dart';
import 'package:meta/meta.dart';

import '../../../injection.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial());
  var repo = sl.get<IRepository>();
  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is IsLoginEvent) {
      bool islogin = await repo.iprefsHelper.getislogin();
      yield IsLoginState(islogin);
    }
  }
}
