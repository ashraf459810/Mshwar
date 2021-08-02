import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dellyshop/Data/Repository/IRepository.dart';
import 'package:dellyshop/models/CitiesModel/cities.dart';
import 'package:dellyshop/models/RegisterModel/RegisterModel.dart';

import 'package:meta/meta.dart';

import '../../../../injection.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial());
  var repo = sl.get<IRepository>();
  Cities cities;
  RegisterModel registerModel;

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is CitiesEvent) {
      print("here from event");
      yield Loading();
      try {
        var cities = await repo.getrequest(
            ([response]) => citiesFromJson(response), "/Cities");

        yield CitiesState(cities.cities);
      } catch (error) {
        yield Error(error.toString());
      }
    }
    if (event is RegisterE) {
      print("here from bloc");
      yield Loading();
      try {
        var response = await repo.iHttpHlper.getrequest(
            "/Register?name=${event.name}&email=${event.email}&password=${event.password}&phone=${event.phone}&cities_id=${event.cityid}");
        registerModel = registerModelFromJson(response);
        yield RegisterS();
        repo.iprefsHelper.setislogin(true);
        repo.iprefsHelper.settoken(registerModel.apiToken);
      } on SocketException {
        yield Error("Check your connection");
      } catch (e) {
        print("ere from expetopn");
        print(e.toString());
        yield Error(e.toString());
      }
    }
  }
}
