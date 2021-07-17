// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        this.azsvr,
        this.apiToken,
        this.reason,
    });

    String azsvr;
    String apiToken;
    String reason;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        azsvr: json["AZSVR"],
        apiToken: json["api_token"],
        reason: json["reason"],
    );

    Map<String, dynamic> toJson() => {
        "AZSVR": azsvr,
        "api_token": apiToken,
        "reason": reason,
    };
}
