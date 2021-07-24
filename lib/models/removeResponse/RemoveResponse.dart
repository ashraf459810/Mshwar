// To parse this JSON data, do
//
//     final removeResponse = removeResponseFromJson(jsonString);

import 'dart:convert';

RemoveResponse removeResponseFromJson(String str) =>
    RemoveResponse.fromJson(json.decode(str));

String removeResponseToJson(RemoveResponse data) => json.encode(data.toJson());

class RemoveResponse {
  RemoveResponse({
    this.azsvr,
    this.cartId,
  });

  String azsvr;
  String cartId;

  factory RemoveResponse.fromJson(Map<String, dynamic> json) => RemoveResponse(
        azsvr: json["AZSVR"],
        cartId: json["CartID"],
      );

  Map<String, dynamic> toJson() => {
        "AZSVR": azsvr,
        "CartID": cartId,
      };
}
