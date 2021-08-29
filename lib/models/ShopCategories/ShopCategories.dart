// To parse this JSON data, do
//
//     final shopCategories = shopCategoriesFromJson(jsonString);

import 'dart:convert';

ShopCategories shopCategoriesFromJson(String str) =>
    ShopCategories.fromJson(json.decode(str));

String shopCategoriesToJson(ShopCategories data) => json.encode(data.toJson());

class ShopCategories {
  ShopCategories({
    this.azsvr,
    this.shopCategories,
  });

  String azsvr;
  List<ShopCategory> shopCategories;

  factory ShopCategories.fromJson(Map<String, dynamic> json) => ShopCategories(
        azsvr: json["AZSVR"],
        shopCategories: List<ShopCategory>.from(
            json["ShopCategories"].map((x) => ShopCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "AZSVR": azsvr,
        "ShopCategories":
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
    this.items,
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
  List<Item> items;

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
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
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
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.id,
    this.title,
    this.titleEn,
    this.description,
    this.descriptionEn,
    this.internalNotes,
    this.images,
    this.quantity,
    this.prepTime,
    this.price,
    this.active,
    this.usersId,
    this.discount,
    this.lastPushTime,
    this.shopsId,
    this.shopCategoriesId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String title;
  String titleEn;
  String description;
  String descriptionEn;
  dynamic internalNotes;
  String images;
  int quantity;
  int prepTime;
  String price;
  int active;
  int usersId;
  int discount;
  String lastPushTime;
  int shopsId;
  int shopCategoriesId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        title: json["title"],
        titleEn: json["title_en"],
        description: json["description"],
        descriptionEn: json["description_en"],
        internalNotes: json["internal_notes"],
        images: json["images"],
        quantity: json["quantity"],
        prepTime: json["prep_time"],
        price: json["price"],
        active: json["active"],
        usersId: json["users_id"],
        discount: json["discount"],
        lastPushTime: json["last_push_time"],
        shopsId: json["shops_id"],
        shopCategoriesId: json["shop_categories_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "title_en": titleEn,
        "description": description,
        "description_en": descriptionEn,
        "internal_notes": internalNotes,
        "images": images,
        "quantity": quantity,
        "prep_time": prepTime,
        "price": price,
        "active": active,
        "users_id": usersId,
        "discount": discount,
        "last_push_time": lastPushTime,
        "shops_id": shopsId,
        "shop_categories_id": shopCategoriesId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
