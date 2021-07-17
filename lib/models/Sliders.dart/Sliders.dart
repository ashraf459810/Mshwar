// To parse this JSON data, do
//
//     final sliders = slidersFromJson(jsonString);

import 'dart:convert';

Sliders slidersFromJson(String str) => Sliders.fromJson(json.decode(str));

String slidersToJson(Sliders data) => json.encode(data.toJson());

class Sliders {
    Sliders({
        this.azsvr,
        this.slides,
    });

    String azsvr;
    List<Slide> slides;

    factory Sliders.fromJson(Map<String, dynamic> json) => Sliders(
        azsvr: json["AZSVR"],
        slides: List<Slide>.from(json["Slides"].map((x) => Slide.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "AZSVR": azsvr,
        "Slides": List<dynamic>.from(slides.map((x) => x.toJson())),
    };
}

class Slide {
    Slide({
        this.id,
        this.image,
        this.shopsId,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String image;
    String shopsId;
    DateTime createdAt;
    DateTime updatedAt;

    factory Slide.fromJson(Map<String, dynamic> json) => Slide(
        id: json["id"],
        image: json["image"],
        shopsId: json["shops_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "shops_id": shopsId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
