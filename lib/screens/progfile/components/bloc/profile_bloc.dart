import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dellyshop/Data/Repository/IRepository.dart';
import 'package:dellyshop/models/CartHistory/CartHistory.dart';
import 'package:dellyshop/models/ProfileModel/ProfileModel.dart';
import 'package:meta/meta.dart';
import 'package:dellyshop/injection.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial());
  var repo = sl.get<IRepository>();
  ProfileModel profileModel;
  CartHistory cartHistory;
  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is GetProfileEvent) {
      yield Loading();
      String id = await repo.iprefsHelper.gettoken();
      try {
        var response = await repo.iHttpHlper.getrequest("/user?api_token=$id");
        profileModel = profileModelFromJson(response);
        yield GetProfileState(profileModel);
      } catch (e) {
        yield Error(e.toString());
      }
    }
    if (event is CartHistoryEvent) {
      yield Loading();
      String token = await repo.iprefsHelper.gettoken();
      // try {
      var response = await repo.iHttpHlper
          .getrequest("/Orders/ListMyOrders?api_token=$token");
      cartHistory = cartHistoryFromJson(response);
      yield CartHistoryState(cartHistory);
      // } catch (error) {
      //   yield (Error(error.toString()));
      // }
    }
  }
}
