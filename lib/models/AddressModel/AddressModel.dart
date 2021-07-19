// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

AddressModel addressModelFromJson(String str) =>
    AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
  AddressModel({
    this.azsvr,
    this.addresses,
  });

  String azsvr;
  List<Address> addresses;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        azsvr: json["AZSVR"],
        addresses: List<Address>.from(
            json["Addresses"].map((x) => Address.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "AZSVR": azsvr,
        "Addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
      };
}

class Address {
  Address({
    this.id,
    this.usersId,
    this.name,
    this.citiesId,
    this.locationLat,
    this.locationLng,
    this.address1,
    this.address2,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.city,
  });

  int id;
  int usersId;
  String name;
  int citiesId;
  String locationLat;
  String locationLng;
  String address1;
  dynamic address2;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  City city;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        usersId: json["users_id"],
        name: json["name"],
        citiesId: json["cities_id"],
        locationLat: json["location_lat"],
        locationLng: json["location_lng"],
        address1: json["address_1"],
        address2: json["address_2"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        city: City.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "users_id": usersId,
        "name": name,
        "cities_id": citiesId,
        "location_lat": locationLat,
        "location_lng": locationLng,
        "address_1": address1,
        "address_2": address2,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "city": city.toJson(),
      };
}

class City {
  City({
    this.id,
    this.title,
    this.countryIsoCode,
    this.parentId,
    this.baseDeliveryPrice,
    this.extraDeliveryPrice,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String title;
  String countryIsoCode;
  dynamic parentId;
  int baseDeliveryPrice;
  int extraDeliveryPrice;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        title: json["title"],
        countryIsoCode: json["country_iso_code"],
        parentId: json["parent_id"],
        baseDeliveryPrice: json["base_delivery_price"],
        extraDeliveryPrice: json["extra_delivery_price"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "country_iso_code": countryIsoCode,
        "parent_id": parentId,
        "base_delivery_price": baseDeliveryPrice,
        "extra_delivery_price": extraDeliveryPrice,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}
