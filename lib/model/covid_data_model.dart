// To parse this JSON data, do
//
//     final covidDataModel = covidDataModelFromJson(jsonString);

import 'dart:convert';

List<CovidDataModel> covidDataModelFromJson(String str) =>
    List<CovidDataModel>.from(
        json.decode(str).map((x) => CovidDataModel.fromJson(x)));

String covidDataModelToJson(List<CovidDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CovidDataModel {
  CovidDataModel({
    required this.country,
    required this.code,
    required this.confirmed,
    required this.recovered,
    required this.critical,
    required this.deaths,
    required this.latitude,
    required this.longitude,
    required this.lastChange,
    required this.lastUpdate,
  });

  String country;
  String code;
  int confirmed;
  int recovered;
  int critical;
  int deaths;
  double latitude;
  double longitude;
  DateTime? lastChange;
  DateTime? lastUpdate;

  factory CovidDataModel.fromJson(Map<String, dynamic> json) => CovidDataModel(
        country: json["country"],
        code: json["code"] == null ? null : json["code"],
        confirmed: json["confirmed"],
        recovered: json["recovered"],
        critical: json["critical"],
        deaths: json["deaths"],
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        longitude:
            json["longitude"] == null ? null : json["longitude"].toDouble(),
        lastChange: json["lastChange"] == null
            ? null
            : DateTime.parse(json["lastChange"]),
        lastUpdate: json["lastUpdate"] == null
            ? null
            : DateTime.parse(json["lastUpdate"]),
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "code": code == null ? null : code,
        "confirmed": confirmed,
        "recovered": recovered,
        "critical": critical,
        "deaths": deaths,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "lastChange": lastChange == null ? null : lastChange!.toIso8601String(),
        "lastUpdate": lastUpdate == null
            ? null
            : lastUpdate!.toIso8601String().trimRight(),
      };
}
