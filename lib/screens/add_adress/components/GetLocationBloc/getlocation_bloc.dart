import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dellyshop/Data/Repository/IRepository.dart';
import 'package:dellyshop/models/AddAddressResponse/AddAddressResponse.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dellyshop/injection.dart';
part 'getlocation_event.dart';
part 'getlocation_state.dart';

class GetlocationBloc extends Bloc<GetlocationEvent, GetlocationState> {
  GetlocationBloc() : super(GetlocationInitial());
  Position position;
  var repo = sl.get<IRepository>();
  String city;
  String street;
  String country;
  var info;
  AddAddressResponse addAddressResponse;
  @override
  Stream<GetlocationState> mapEventToState(
    GetlocationEvent event,
  ) async* {
    if (event is GetlocationEvent) {
      yield Loading();
      await Permission.location.isGranted;
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // position = await functions.determinePosition();
      print("here the postion $position");
      if (position == null) {
        yield Error("There is a problem with gettin your location");
      } else {
        info = await getLocationAddress(position.latitude, position.longitude);
        country = info[0].country;

        city = info[0].administrativeArea;

        // print(info[1].name);
        // print(info[1].locality);
        street = info[0].street;
        print(info);

        yield LocationState(position, city, country, street);
      }
    }
    if (event is AddAddressEvent) {
      try {
        String token = await repo.iprefsHelper.gettoken();
        var response = await repo.iHttpHlper.getrequest(
            "/Addresses/Add?name=${event.addressname}&location_lat=${event.lat}&location_lng=${event.lng}&cities_id=${event.cityid}&address_1=${event.address1}&api_token=$token");
        addAddressResponse = addAddressResponseFromJson(response);
        yield AddAddressState(addAddressResponse);
      } catch (error) {
        yield Error(error);
      }
    }
  }

  Future<List<Placemark>> getLocationAddress(
      double latitude, double longitude) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    return placemarks;
  }
}
