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

const Map<String, String> typeMap = {
  "010": "정상아동(18세미만)",
  "020": "가출인",
  "040": "시설보호무연고자",
  "060": "지적장애인",
  "061": "지적장애인(18세미만)",
  "062": "지적장애인(18세이상)",
  "070": "치매질환자",
  "080": "불상(기타)"
};
