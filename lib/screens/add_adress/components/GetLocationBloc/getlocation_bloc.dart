import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dellyshop/Data/Repository/IRepository.dart';
import 'package:dellyshop/models/AddAddressResponse/AddAddressResponse.dart';
import 'package:dellyshop/models/AddressModel/AddressModel.dart';

import 'package:geolocator/geolocator.dart';

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
  AddressModel addressModel;
  var info;
  AddAddressResponse addAddressResponse;
  @override
  Stream<GetlocationState> mapEventToState(
    GetlocationEvent event,
  ) async* {
    if (event is LocationEvent) {
      print("here the event is triggered");
      yield Loading();
      await Permission.location.isGranted;
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // position = await functions.determinePosition();
      print("here stuck the postion $position");
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
    if (event is RemoveAddressEvent) {
      yield Loading();
      try {
        String token = await repo.iprefsHelper.gettoken();
        var response = await repo.iHttpHlper.getrequest(
            "/Addresses/Remove/${event.addressid}?api_token=$token");
        print(response);
        addressModel = addressModelFromJson(response);

        yield RemoveAddressState(addressModel);
      } catch (error) {
        yield Error(error.toString());
      }
    }
    if (event is UpdateAddressEvent) {
      try {
        String token = await repo.iprefsHelper.gettoken();
        var response = await repo.iHttpHlper.getrequest(
            "/Addresses/Update/${event.addressid}?name=${event.name}&location_lat=${event.lat}&location_lng=${event.long}&cities_id=${event.cityid}&address_1=${event.address1}&api_token=$token");
        if (response != null) {
          yield UpdateAddressState();
        }
      } catch (error) {
        yield Error(error);
      }
    }
    if (event is GetAddressEvent) {
      String token = await repo.iprefsHelper.gettoken();

      if (token != null) {
        try {
          var response =
              await repo.iHttpHlper.getrequest("/Addresses?api_token=$token");
          addressModel = addressModelFromJson(response);
          yield GetAddressState(addressModel);
        } catch (error) {
          yield Error(error.toString());
        }
      }
    } else {}
    if (event is TaxiOrderEvent) {
      yield Loading();
      try {
        String token = await repo.iprefsHelper.gettoken();
        var response = await repo.iHttpHlper.getrequest(
            "/Orders/TaxiPlaceOrder?addresses_id=${event.addressid}&user_lat=${event.lat}&user_lng=${event.long}&api_token=$token");
        if (response != null) {
          yield TaxiOrderState();
        }
      } catch (error) {
        yield Error(error.toString());
      }
    }
  }
}

Future<List<Placemark>> getLocationAddress(
    double latitude, double longitude) async {
  List<Placemark> placemarks =
      await placemarkFromCoordinates(latitude, longitude);
  return placemarks;
}
