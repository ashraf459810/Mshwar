part of 'getlocation_bloc.dart';

@immutable
abstract class GetlocationState {}

class GetlocationInitial extends GetlocationState {}

class LocationState extends GetlocationState {
  final Position position;
  final String city;
  final String country;
  final String street;

  LocationState(this.position, this.city, this.country, this.street);
}

class Error extends GetlocationState {
  final String error;
  Error(this.error);
}

class Loading extends GetlocationState {}

class AddAddressState extends GetlocationState {
  final AddAddressResponse addAddressResponse;
  AddAddressState(this.addAddressResponse);
}
