import 'package:flutter/material.dart';

class Child {
  final String occurDate;
  final String occurAge;
  final String currentAge;
  final String type;
  final String sex;
  final String features;
  final String dress;
  final String occurAddress;
  final String imageUrl;
  final String name;

  Child(
      {required this.occurDate,
      required this.occurAge,
      required this.currentAge,
      required this.type,
      required this.sex,
      required this.features,
      required this.dress,
      required this.occurAddress,
      required this.imageUrl,
      required this.name});

  factory Child.fromJson(Map<String, dynamic> json) {
    return Child(
        name: json['nm'] ?? "정보없음",
        occurDate: json['occrde'] ?? "정보없음",
        occurAge: json['age']?.toString() ?? "정보없음",
        currentAge: json['ageNow'] ?? "정보없음",
        type: json['writngTrgetDscd'] ?? "정보없음",
        sex: json['sexdstnDscd'] ?? "정보없음",
        features: json['etcSpfeatr'] ?? "정보없음",
        dress: json['alldressingDscd'] ?? "정보없음",
        occurAddress: json['occrAdres'] ?? "정보없음",
        imageUrl:
            "http://www.safe182.go.kr/api/lcm/imgView.do?msspsnIdntfccd=${json['msspsnIdntfccd']}");
  }
}
