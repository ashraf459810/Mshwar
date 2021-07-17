// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
    CategoriesModel({
        this.azsvr,
        this.categories,
        this.categoriesDropdown,
    });

    String azsvr;
    List<Category> categories;
    Map<String, CategoriesDropdown> categoriesDropdown;

    factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
        azsvr: json["AZSVR"],
        categories: List<Category>.from(json["Categories"].map((x) => Category.fromJson(x))),
        categoriesDropdown: Map.from(json["CategoriesDropdown"]).map((k, v) => MapEntry<String, CategoriesDropdown>(k, CategoriesDropdown.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "AZSVR": azsvr,
        "Categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "CategoriesDropdown": Map.from(categoriesDropdown).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class Category {
    Category({
        this.id,
        this.title,
        this.titleEn,
        this.parentId,
        this.image,
        this.active,
        this.icon,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.shopsCount,
    });

    int id;
    String title;
    String titleEn;
    dynamic parentId;
    String image;
    int active;
    dynamic icon;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    int shopsCount;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: json["title"],
        titleEn: json["title_en"],
        parentId: json["parent_id"],
        image: json["image"],
        active: json["active"],
        icon: json["icon"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        shopsCount: json["shops_count"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "title_en": titleEn,
        "parent_id": parentId,
        "image": image,
        "active": active,
        "icon": icon,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "shops_count": shopsCount,
    };
}

class CategoriesDropdown {
    CategoriesDropdown({
        this.id,
        this.title,
        this.image,
    });

    int id;
    String title;
    String image;

    factory CategoriesDropdown.fromJson(Map<String, dynamic> json) => CategoriesDropdown(
        id: json["id"],
        title: json["title"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
    };
}
