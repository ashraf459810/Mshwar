// To parse this JSON data, do
//
//     final categoryShopsModel = categoryShopsModelFromJson(jsonString);

import 'dart:convert';

CategoryShopsModel categoryShopsModelFromJson(String str) =>
    CategoryShopsModel.fromJson(json.decode(str));

String categoryShopsModelToJson(CategoryShopsModel data) =>
    json.encode(data.toJson());

class CategoryShopsModel {
  CategoryShopsModel({
    this.azsvr,
    this.shops,
  });

  String azsvr;
  List<Shop> shops;

  factory CategoryShopsModel.fromJson(Map<String, dynamic> json) =>
      CategoryShopsModel(
        azsvr: json["AZSVR"],
        shops: List<Shop>.from(json["Shops"].map((x) => Shop.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "AZSVR": azsvr,
        "Shops": List<dynamic>.from(shops.map((x) => x.toJson())),
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
    this.shopCategories,
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
  List<ShopCategory> shopCategories;

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
        shopCategories: List<ShopCategory>.from(
            json["shop_categories"].map((x) => ShopCategory.fromJson(x))),
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
        "shop_categories":
            List<dynamic>.from(shopCategories.map((x) => x.toJson())),
      };
}

class ShopCategory {
  ShopCategory({
    this.id,
    this.shopsId,
    this.title,
    this.titleEn,
    this.parentId,
    this.image,
    this.active,
    this.icon,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  int shopsId;
  String title;
  String titleEn;
  dynamic parentId;
  String image;
  int active;
  dynamic icon;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory ShopCategory.fromJson(Map<String, dynamic> json) => ShopCategory(
        id: json["id"],
        shopsId: json["shops_id"],
        title: json["title"],
        titleEn: json["title_en"],
        parentId: json["parent_id"],
        image: json["image"],
        active: json["active"],
        icon: json["icon"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shops_id": shopsId,
        "title": title,
        "title_en": titleEn,
        "parent_id": parentId,
        "image": image,
        "active": active,
        "icon": icon,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
