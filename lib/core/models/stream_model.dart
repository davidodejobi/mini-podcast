import 'dart:convert';

List<StreamModel> streamModelFromJson(String str) => List<StreamModel>.from(
    json.decode(str).map((x) => StreamModel.fromJson(x)));

String streamModelToJson(List<StreamModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StreamModel {
  StreamModel({
    this.title,
    this.description,
    this.year,
    this.audioUrl,
    this.imageUrl,
  });

  String? title;
  String? description;
  String? year;
  String? audioUrl;
  String? imageUrl;

  factory StreamModel.fromJson(Map<String, dynamic> json) => StreamModel(
        title: json["Title"],
        description: json["Description"],
        year: json["Year"],
        audioUrl: json["AudioUrl"],
        imageUrl: json["ImageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Description": description,
        "Year": year,
        "AudioUrl": audioUrl,
        "ImageUrl": imageUrl,
      };
}
