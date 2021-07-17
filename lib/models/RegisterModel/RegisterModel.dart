// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
    RegisterModel({
        this.azsvr,
        this.apiToken,
    });

    String azsvr;
    String apiToken;

    factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        azsvr: json["AZSVR"],
        apiToken: json["api_token"],
    );

    Map<String, dynamic> toJson() => {
        "AZSVR": azsvr,
        "api_token": apiToken,
    };
}
