// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    this.azsvr,
    this.carts,
    this.customCarts,
    this.membershipDiscount,
    this.cartsTotal,
    this.deliveryFees,
  });

  String azsvr;
  List<Cart> carts;
  List<dynamic> customCarts;
  String membershipDiscount;
  double cartsTotal;
  int deliveryFees;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        azsvr: json["AZSVR"],
        carts: List<Cart>.from(json["Carts"].map((x) => Cart.fromJson(x))),
        customCarts: List<dynamic>.from(json["CustomCarts"].map((x) => x)),
        membershipDiscount: json["MembershipDiscount"],
        cartsTotal: json["CartsTotal"].toDouble(),
        deliveryFees: json["DeliveryFees"],
      );

  Map<String, dynamic> toJson() => {
        "AZSVR": azsvr,
        "Carts": List<dynamic>.from(carts.map((x) => x.toJson())),
        "CustomCarts": List<dynamic>.from(customCarts.map((x) => x)),
        "MembershipDiscount": membershipDiscount,
        "CartsTotal": cartsTotal,
        "DeliveryFees": deliveryFees,
      };
}

class Cart {
  Cart({
    this.id,
    this.usersId,
    this.itemsId,
    this.quantity,
    this.notes,
    this.isCustom,
    this.shopsId,
    this.createdAt,
    this.updatedAt,
    this.subTotal,
    this.membershipDiscount,
    this.total,
    this.customAttributesValues,
    this.items,
  });

  int id;
  int usersId;
  int itemsId;
  int quantity;
  dynamic notes;
  int isCustom;
  dynamic shopsId;
  DateTime createdAt;
  DateTime updatedAt;
  int subTotal;
  double membershipDiscount;
  double total;
  List<CustomAttributesValue> customAttributesValues;
  Items items;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        usersId: json["users_id"],
        itemsId: json["items_id"],
        quantity: json["quantity"],
        notes: json["notes"],
        isCustom: json["isCustom"],
        shopsId: json["shops_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        subTotal: json["sub_total"],
        membershipDiscount: json["MembershipDiscount"].toDouble(),
        total: json["total"].toDouble(),
        customAttributesValues: List<CustomAttributesValue>.from(
            json["custom_attributes_values"]
                .map((x) => CustomAttributesValue.fromJson(x))),
        items: Items.fromJson(json["items"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "users_id": usersId,
        "items_id": itemsId,
        "quantity": quantity,
        "notes": notes,
        "isCustom": isCustom,
        "shops_id": shopsId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "sub_total": subTotal,
        "MembershipDiscount": membershipDiscount,
        "total": total,
        "custom_attributes_values":
            List<dynamic>.from(customAttributesValues.map((x) => x.toJson())),
        "items": items.toJson(),
      };
}

class CustomAttributesValue {
  CustomAttributesValue({
    this.id,
    this.customAttributesId,
    this.name,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.pivot,
  });

  int id;
  int customAttributesId;
  String name;
  String price;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  Pivot pivot;

  factory CustomAttributesValue.fromJson(Map<String, dynamic> json) =>
      CustomAttributesValue(
        id: json["id"],
        customAttributesId: json["custom_attributes_id"],
        name: json["name"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        pivot: Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "custom_attributes_id": customAttributesId,
        "name": name,
        "price": price,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "pivot": pivot.toJson(),
      };
}

class Pivot {
  Pivot({
    this.cartsId,
    this.customAttributesValuesId,
  });

  int cartsId;
  int customAttributesValuesId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        cartsId: json["carts_id"],
        customAttributesValuesId: json["custom_attributes_values_id"],
      );

  Map<String, dynamic> toJson() => {
        "carts_id": cartsId,
        "custom_attributes_values_id": customAttributesValuesId,
      };
}

class Items {
  Items({
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

  factory Items.fromJson(Map<String, dynamic> json) => Items(
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
