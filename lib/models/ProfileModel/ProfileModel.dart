// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    ProfileModel({
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

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
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
