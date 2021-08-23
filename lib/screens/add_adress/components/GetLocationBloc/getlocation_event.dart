part of 'getlocation_bloc.dart';

@immutable
abstract class GetlocationEvent {}

class LocationEvent extends GetlocationEvent {}

class AddAddressEvent extends GetlocationEvent {
  final String addressname;
  final String address1;
  final int cityid;
  final double lat;
  final double lng;
  AddAddressEvent(
      this.address1, this.addressname, this.cityid, this.lat, this.lng);
}

class RemoveAddressEvent extends GetlocationEvent {
  final int addressid;
  RemoveAddressEvent(this.addressid);
}

class UpdateAddressEvent extends GetlocationEvent {
  final int addressid;
  final String name;
  final double lat;
  final double long;
  final int cityid;
  final String address1;
  final String token;
  UpdateAddressEvent(
      {this.address1,
      this.addressid,
      this.cityid,
      this.lat,
      this.long,
      this.name,
      this.token});
}

class GetAddressEvent extends GetlocationEvent {}

class TaxiOrderEvent extends GetlocationEvent {
  final int addressid;
  final double lat;
  final double long;
  TaxiOrderEvent(this.addressid, this.long, this.lat);
}

class GetIfLoginEvent extends GetlocationEvent {}
