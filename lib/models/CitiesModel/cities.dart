// To parse this JSON data, do
//
//     final cities = citiesFromJson(jsonString);

import 'dart:convert';

Cities citiesFromJson(String str) => Cities.fromJson(json.decode(str));

String citiesToJson(Cities data) => json.encode(data.toJson());

class Cities {
  Cities({
    this.azsvr,
    this.cities,
  });

  String azsvr;
  List<City> cities;

  factory Cities.fromJson(Map<String, dynamic> json) => Cities(
        azsvr: json["AZSVR"],
        cities: List<City>.from(json["Cities"].map((x) => City.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "AZSVR": azsvr,
        "Cities": List<dynamic>.from(cities.map((x) => x.toJson())),
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
  CountryIsoCode countryIsoCode;
  dynamic parentId;
  int baseDeliveryPrice;
  double extraDeliveryPrice;
  dynamic createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        title: json["title"],
        countryIsoCode: countryIsoCodeValues.map[json["country_iso_code"]],
        parentId: json["parent_id"],
        baseDeliveryPrice: json["base_delivery_price"],
        extraDeliveryPrice: json["extra_delivery_price"].toDouble(),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "country_iso_code": countryIsoCodeValues.reverse[countryIsoCode],
        "parent_id": parentId,
        "base_delivery_price": baseDeliveryPrice,
        "extra_delivery_price": extraDeliveryPrice,
        "created_at": createdAt,
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}

enum CountryIsoCode { JO }

final countryIsoCodeValues = EnumValues({"JO": CountryIsoCode.JO});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
