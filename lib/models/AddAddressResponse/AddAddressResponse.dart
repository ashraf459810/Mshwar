// To parse this JSON data, do
//
//     final addAddressResponse = addAddressResponseFromJson(jsonString);

import 'dart:convert';

AddAddressResponse addAddressResponseFromJson(String str) =>
    AddAddressResponse.fromJson(json.decode(str));

String addAddressResponseToJson(AddAddressResponse data) =>
    json.encode(data.toJson());

class AddAddressResponse {
  AddAddressResponse({
    this.azsvr,
    this.newAddressId,
  });

  String azsvr;
  int newAddressId;

  factory AddAddressResponse.fromJson(Map<String, dynamic> json) =>
      AddAddressResponse(
        azsvr: json["AZSVR"],
        newAddressId: json["NewAddressID"],
      );

  Map<String, dynamic> toJson() => {
        "AZSVR": azsvr,
        "NewAddressID": newAddressId,
      };
}
