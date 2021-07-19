import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dellyshop/Data/Repository/IRepository.dart';
import 'package:dellyshop/injection.dart';
import 'package:dellyshop/models/LoginModel/LoginModel.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());
  var repo = sl.get<IRepository>();
  LoginModel loginModel;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginE) {
      yield Loading();

      try {
        var response = await repo.iHttpHlper
            .getrequest("/GetToken/${event.identity}/${event.password}");
        loginModel = loginModelFromJson(response);
        if (loginModel.apiToken == null) {
          yield Error("wrong email or password");
        } else {
          await repo.iprefsHelper.setislogin(true);
          await repo.iprefsHelper.settoken(loginModel.apiToken);
          print(loginModel.apiToken);

          print(loginModel.apiToken);
          yield LoginS();
        }
      } catch (e) {
        yield Error(e.toString());
      }
    }
  }
}
