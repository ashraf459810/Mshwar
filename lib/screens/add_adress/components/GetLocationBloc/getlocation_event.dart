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
