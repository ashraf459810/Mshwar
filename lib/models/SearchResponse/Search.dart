// To parse this JSON data, do
//
//     final searchResponse = searchResponseFromJson(jsonString);

import 'dart:convert';

SearchResponse searchResponseFromJson(String str) =>
    SearchResponse.fromJson(json.decode(str));

String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());

class SearchResponse {
  SearchResponse({
    this.azsvr,
    this.items,
  });

  String azsvr;
  Items items;

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        azsvr: json["AZSVR"],
        items: Items.fromJson(json["Items"]),
      );

  Map<String, dynamic> toJson() => {
        "AZSVR": azsvr,
        "Items": items.toJson(),
      };
}

class Items {
  Items({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int currentPage;
  List<Data> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  dynamic nextPageUrl;
  String path;
  String perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        currentPage: json["current_page"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Data {
  Data({
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
    this.ratesAvg,
    this.comments,
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
  int ratesAvg;
  List<dynamic> comments;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        ratesAvg: json["RatesAvg"],
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
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
        "RatesAvg": ratesAvg,
        "comments": List<dynamic>.from(comments.map((x) => x)),
      };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String url;
  String label;
  bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] == null ? null : json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label,
        "active": active,
      };
}
