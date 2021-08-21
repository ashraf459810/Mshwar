// To parse this JSON data, do
//
//     final cartHistory = cartHistoryFromJson(jsonString);

import 'dart:convert';

CartHistory cartHistoryFromJson(String str) =>
    CartHistory.fromJson(json.decode(str));

String cartHistoryToJson(CartHistory data) => json.encode(data.toJson());

class CartHistory {
  CartHistory({
    this.azsvr,
    this.myOrders,
    this.taxiOrderItems,
  });

  String azsvr;
  List<MyOrder> myOrders;
  List<TaxiOrderItem> taxiOrderItems;

  factory CartHistory.fromJson(Map<String, dynamic> json) => CartHistory(
        azsvr: json["AZSVR"],
        myOrders: List<MyOrder>.from(
            json["MyOrders"].map((x) => MyOrder.fromJson(x))),
        taxiOrderItems: List<TaxiOrderItem>.from(
            json["TaxiOrderItems"].map((x) => TaxiOrderItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "AZSVR": azsvr,
        "MyOrders": List<dynamic>.from(myOrders.map((x) => x.toJson())),
        "TaxiOrderItems":
            List<dynamic>.from(taxiOrderItems.map((x) => x.toJson())),
      };
}

class MyOrder {
  MyOrder({
    this.id,
    this.usersId,
    this.ordersId,
    this.itemsId,
    this.promosId,
    this.membershipsId,
    this.lastUpdateId,
    this.shopsId,
    this.driverId,
    this.itemName,
    this.itemPrepTime,
    this.itemAttributes,
    this.quantity,
    this.price,
    this.attributesPrice,
    this.membershipDiscountPercentage,
    this.membershipDiscountAmount,
    this.itemDiscountPercentage,
    this.itemDiscountAmount,
    this.promoFixed,
    this.promoPercentage,
    this.promoPercentageAmount,
    this.userNotes,
    this.statusesId,
    this.refundApplied,
    this.cancelReasonsId,
    this.subTotal,
    this.total,
    this.createdAt,
    this.updatedAt,
    this.invoiceId,
    this.mainImage,
    this.shop,
    this.status,
    this.user,
    this.membership,
    this.order,
    this.item,
  });

  int id;
  int usersId;
  int ordersId;
  int itemsId;
  dynamic promosId;
  int membershipsId;
  int lastUpdateId;
  int shopsId;
  dynamic driverId;
  String itemName;
  int itemPrepTime;
  dynamic itemAttributes;
  int quantity;
  double price;
  dynamic attributesPrice;
  int membershipDiscountPercentage;
  double membershipDiscountAmount;
  dynamic itemDiscountPercentage;
  double itemDiscountAmount;
  dynamic promoFixed;
  dynamic promoPercentage;
  dynamic promoPercentageAmount;
  dynamic userNotes;
  int statusesId;
  int refundApplied;
  dynamic cancelReasonsId;
  dynamic subTotal;
  double total;
  DateTime createdAt;
  DateTime updatedAt;
  int invoiceId;
  String mainImage;
  Shop shop;
  Status status;
  User user;
  Membership membership;
  Order order;
  Item item;

  factory MyOrder.fromJson(Map<String, dynamic> json) => MyOrder(
        id: json["id"],
        usersId: json["users_id"],
        ordersId: json["orders_id"],
        itemsId: json["items_id"],
        promosId: json["promos_id"],
        membershipsId: json["memberships_id"],
        lastUpdateId: json["last_update_id"],
        shopsId: json["shops_id"],
        driverId: json["driver_id"],
        itemName: json["item_name"],
        itemPrepTime: json["item_prep_time"],
        itemAttributes: json["item_attributes"],
        quantity: json["quantity"],
        price: json["price"].toDouble(),
        attributesPrice: json["attributes_price"],
        membershipDiscountPercentage: json["membership_discount_percentage"],
        membershipDiscountAmount: json["membership_discount_amount"].toDouble(),
        itemDiscountPercentage: json["item_discount_percentage"] == null
            ? null
            : json["item_discount_percentage"],
        itemDiscountAmount: json["item_discount_amount"] == null
            ? null
            : json["item_discount_amount"].toDouble(),
        promoFixed: json["promo_fixed"],
        promoPercentage: json["promo_percentage"],
        promoPercentageAmount: json["promo_percentage_amount"],
        userNotes: json["user_notes"],
        statusesId: json["statuses_id"],
        refundApplied: json["refund_applied"],
        cancelReasonsId: json["cancel_reasons_id"],
        subTotal: json["sub_total"],
        total: json["total"].toDouble(),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        invoiceId: json["invoice_id"],
        mainImage: json["mainImage"],
        shop: Shop.fromJson(json["shop"]),
        status: Status.fromJson(json["status"]),
        user: User.fromJson(json["user"]),
        membership: Membership.fromJson(json["membership"]),
        order: Order.fromJson(json["order"]),
        item: Item.fromJson(json["item"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "users_id": usersId,
        "orders_id": ordersId,
        "items_id": itemsId,
        "promos_id": promosId,
        "memberships_id": membershipsId,
        "last_update_id": lastUpdateId,
        "shops_id": shopsId,
        "driver_id": driverId,
        "item_name": itemName,
        "item_prep_time": itemPrepTime,
        "item_attributes": itemAttributes,
        "quantity": quantity,
        "price": price,
        "attributes_price": attributesPrice,
        "membership_discount_percentage": membershipDiscountPercentage,
        "membership_discount_amount": membershipDiscountAmount,
        "item_discount_percentage":
            itemDiscountPercentage == null ? null : itemDiscountPercentage,
        "item_discount_amount":
            itemDiscountAmount == null ? null : itemDiscountAmount,
        "promo_fixed": promoFixed,
        "promo_percentage": promoPercentage,
        "promo_percentage_amount": promoPercentageAmount,
        "user_notes": userNotes,
        "statuses_id": statusesId,
        "refund_applied": refundApplied,
        "cancel_reasons_id": cancelReasonsId,
        "sub_total": subTotal,
        "total": total,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "invoice_id": invoiceId,
        "mainImage": mainImage,
        "shop": shop.toJson(),
        "status": status.toJson(),
        "user": user.toJson(),
        "membership": membership.toJson(),
        "order": order.toJson(),
        "item": item.toJson(),
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

class Membership {
  Membership({
    this.id,
    this.name,
    this.permissions,
    this.discount,
    this.isAdmin,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String name;
  String permissions;
  String discount;
  int isAdmin;
  int isActive;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  factory Membership.fromJson(Map<String, dynamic> json) => Membership(
        id: json["id"],
        name: json["name"],
        permissions: json["permissions"],
        discount: json["discount"],
        isAdmin: json["isAdmin"],
        isActive: json["isActive"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "permissions": permissions,
        "discount": discount,
        "isAdmin": isAdmin,
        "isActive": isActive,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}

class Order {
  Order({
    this.id,
    this.usersId,
    this.orderTotal,
    this.paymentMethodsId,
    this.orderType,
    this.driverId,
    this.deliveryFees,
    this.statusesId,
    this.addressesId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.invoice,
  });

  int id;
  int usersId;
  double orderTotal;
  int paymentMethodsId;
  int orderType;
  dynamic driverId;
  int deliveryFees;
  int statusesId;
  int addressesId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  Invoice invoice;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        usersId: json["users_id"],
        orderTotal: json["order_total"].toDouble(),
        paymentMethodsId: json["payment_methods_id"],
        orderType: json["order_type"],
        driverId: json["driver_id"],
        deliveryFees: json["delivery_fees"],
        statusesId: json["statuses_id"],
        addressesId: json["addresses_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        invoice:
            json["invoice"] == null ? null : Invoice.fromJson(json["invoice"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "users_id": usersId,
        "order_total": orderTotal,
        "payment_methods_id": paymentMethodsId,
        "order_type": orderType,
        "driver_id": driverId,
        "delivery_fees": deliveryFees,
        "statuses_id": statusesId,
        "addresses_id": addressesId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "invoice": invoice == null ? null : invoice.toJson(),
      };
}

class Invoice {
  Invoice({
    this.id,
    this.usersId,
    this.ordersId,
    this.total,
    this.invoiceStatusesId,
    this.deliveryFees,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int usersId;
  int ordersId;
  double total;
  int invoiceStatusesId;
  int deliveryFees;
  DateTime createdAt;
  DateTime updatedAt;

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        id: json["id"],
        usersId: json["users_id"],
        ordersId: json["orders_id"],
        total: json["total"].toDouble(),
        invoiceStatusesId: json["invoice_statuses_id"],
        deliveryFees: json["delivery_fees"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "users_id": usersId,
        "orders_id": ordersId,
        "total": total,
        "invoice_statuses_id": invoiceStatusesId,
        "delivery_fees": deliveryFees,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Shop {
  Shop({
    this.id,
    this.name,
    this.nameEn,
    this.categoriesId,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String name;
  String nameEn;
  int categoriesId;
  int active;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        id: json["id"],
        name: json["name"],
        nameEn: json["name_en"],
        categoriesId: json["categories_id"],
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
        "active": active,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}

class Status {
  Status({
    this.id,
    this.name,
    this.color,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String color;
  dynamic createdAt;
  dynamic updatedAt;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        name: "name",
        color: json["color"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class User {
  User({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.emailVerifiedAt,
    this.apiToken,
    this.accountType,
    this.driverTypesId,
    this.groupsId,
    this.extraPermissions,
    this.active,
    this.hidden,
    this.birthDate,
    this.citiesId,
    this.address,
    this.gendersId,
    this.social,
    this.facebookField,
    this.facebookField2,
    this.googleField,
    this.googleField2,
    this.appleField,
    this.appleField2,
    this.userLat,
    this.userLng,
    this.userLocation,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String name;
  String phone;
  String email;
  dynamic emailVerifiedAt;
  String apiToken;
  int accountType;
  dynamic driverTypesId;
  int groupsId;
  dynamic extraPermissions;
  int active;
  int hidden;
  dynamic birthDate;
  int citiesId;
  dynamic address;
  dynamic gendersId;
  dynamic social;
  dynamic facebookField;
  dynamic facebookField2;
  dynamic googleField;
  dynamic googleField2;
  dynamic appleField;
  dynamic appleField2;
  dynamic userLat;
  dynamic userLng;
  dynamic userLocation;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        apiToken: json["api_token"],
        accountType: json["account_type"],
        driverTypesId: json["driver_types_id"],
        groupsId: json["groups_id"],
        extraPermissions: json["extra_permissions"],
        active: json["active"],
        hidden: json["hidden"],
        birthDate: json["birthDate"],
        citiesId: json["cities_id"],
        address: json["address"],
        gendersId: json["genders_id"],
        social: json["social"],
        facebookField: json["facebook_field"],
        facebookField2: json["facebook_field_2"],
        googleField: json["google_field"],
        googleField2: json["google_field_2"],
        appleField: json["apple_field"],
        appleField2: json["apple_field_2"],
        userLat: json["user_lat"],
        userLng: json["user_lng"],
        userLocation: json["user_location"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "api_token": apiToken,
        "account_type": accountType,
        "driver_types_id": driverTypesId,
        "groups_id": groupsId,
        "extra_permissions": extraPermissions,
        "active": active,
        "hidden": hidden,
        "birthDate": birthDate,
        "cities_id": citiesId,
        "address": address,
        "genders_id": gendersId,
        "social": social,
        "facebook_field": facebookField,
        "facebook_field_2": facebookField2,
        "google_field": googleField,
        "google_field_2": googleField2,
        "apple_field": appleField,
        "apple_field_2": appleField2,
        "user_lat": userLat,
        "user_lng": userLng,
        "user_location": userLocation,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}

class TaxiOrderItem {
  TaxiOrderItem({
    this.id,
    this.usersId,
    this.ordersId,
    this.lastUpdateId,
    this.driverId,
    this.userLat,
    this.userLng,
    this.userLocation,
    this.subTotal,
    this.total,
    this.createdAt,
    this.updatedAt,
    this.driver,
    this.order,
  });

  int id;
  int usersId;
  int ordersId;
  int lastUpdateId;
  dynamic driverId;
  String userLat;
  String userLng;
  dynamic userLocation;
  int subTotal;
  int total;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic driver;
  Order order;

  factory TaxiOrderItem.fromJson(Map<String, dynamic> json) => TaxiOrderItem(
        id: json["id"],
        usersId: json["users_id"],
        ordersId: json["orders_id"],
        lastUpdateId: json["last_update_id"],
        driverId: json["driver_id"],
        userLat: json["user_lat"],
        userLng: json["user_lng"],
        userLocation: json["user_location"],
        subTotal: json["sub_total"],
        total: json["total"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        driver: json["driver"],
        order: Order.fromJson(json["order"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "users_id": usersId,
        "orders_id": ordersId,
        "last_update_id": lastUpdateId,
        "driver_id": driverId,
        "user_lat": userLat,
        "user_lng": userLng,
        "user_location": userLocation,
        "sub_total": subTotal,
        "total": total,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "driver": driver,
        "order": order.toJson(),
      };
}
