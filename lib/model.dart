// To parse this JSON data, do
//
//     final samplePosts = samplePostsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SamplePosts samplePostsFromJson(String str) => SamplePosts.fromJson(json.decode(str));

String samplePostsToJson(SamplePosts data) => json.encode(data.toJson());

class SamplePosts {
  String latitude;
  String longitude;

  SamplePosts({
    required this.latitude,
    required this.longitude,
  });

  factory SamplePosts.fromJson(Map<String, dynamic> json) => SamplePosts(
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}
