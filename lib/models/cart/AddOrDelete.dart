// To parse this JSON data, do
//
//     final addOrDelete = addOrDeleteFromJson(jsonString);

import 'dart:convert';

AddResponse addOrDeleteFromJson(String str) =>
    AddResponse.fromJson(json.decode(str));

String addOrDeleteToJson(AddResponse data) => json.encode(data.toJson());

class AddResponse {
  AddResponse({
    this.azsvr,
    this.newCartId,
  });

  String azsvr;
  int newCartId;

  factory AddResponse.fromJson(Map<String, dynamic> json) => AddResponse(
        azsvr: json["AZSVR"],
        newCartId: json["NewCartID"],
      );

  Map<String, dynamic> toJson() => {
        "AZSVR": azsvr,
        "NewCartID": newCartId,
      };
}
