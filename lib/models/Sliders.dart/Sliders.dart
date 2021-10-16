// To parse this JSON data, do
//
//     final sliders = slidersFromJson(jsonString);

import 'dart:convert';

Sliders slidersFromJson(String str) => Sliders.fromJson(json.decode(str));

String slidersToJson(Sliders data) => json.encode(data.toJson());

class Sliders {
  Sliders({
    this.azsvr,
    this.slides,
  });

  String azsvr;
  List<Slide> slides;

  factory Sliders.fromJson(Map<String, dynamic> json) => Sliders(
        azsvr: json["AZSVR"],
        slides: List<Slide>.from(json["Slides"].map((x) => Slide.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "AZSVR": azsvr,
        "Slides": List<dynamic>.from(slides.map((x) => x.toJson())),
      };
}

class Slide {
  Slide({
    this.id,
    this.image,
    this.shopsId,
    this.createdAt,
    this.updatedAt,
    this.shop,
  });

  int id;
  String image;
  String shopsId;
  DateTime createdAt;
  DateTime updatedAt;
  Shop shop;

  factory Slide.fromJson(Map<String, dynamic> json) => Slide(
        id: json["id"],
        image: json["image"],
        shopsId: json["shops_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        shop: Shop.fromJson(json["shop"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "shops_id": shopsId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "shop": shop.toJson(),
      };
}

class Shop {
  Shop({
    this.id,
    this.name,
    this.nameEn,
    this.categoriesId,
    this.images,
    this.workingTime,
    this.phone,
    this.address,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String name;
  String nameEn;
  int categoriesId;
  String images;
  String workingTime;
  String phone;
  String address;
  int active;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        id: json["id"],
        name: json["name"],
        nameEn: json["name_en"],
        categoriesId: json["categories_id"],
        images: json["images"],
        workingTime: json["working_time"],
        phone: json["phone"],
        address: json["address"],
        active: json["active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "name_en": nameEn,
        "categories_id": categoriesId,
        "images": images,
        "working_time": workingTime,
        "phone": phone,
        "address": address,
        "active": active,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
