// To parse this JSON data, do
//
//     final addOrDelete = addOrDeleteFromJson(jsonString);

import 'dart:convert';

AddOrDelete addOrDeleteFromJson(String str) =>
    AddOrDelete.fromJson(json.decode(str));

String addOrDeleteToJson(AddOrDelete data) => json.encode(data.toJson());

class AddOrDelete {
  AddOrDelete({
    this.azsvr,
    this.newCartId,
  });

  String azsvr;
  int newCartId;

  factory AddOrDelete.fromJson(Map<String, dynamic> json) => AddOrDelete(
        azsvr: json["AZSVR"],
        newCartId: json["NewCartID"],
      );

  Map<String, dynamic> toJson() => {
        "AZSVR": azsvr,
        "NewCartID": newCartId,
      };
}
