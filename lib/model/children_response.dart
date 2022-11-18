import 'package:talkative_missing/model/child.dart';

class ChildrenResponse {
  final List<Child> data;
  ChildrenResponse({required this.data});

  factory ChildrenResponse.fromJson(Map<String, dynamic> jsonData) {
    final list = jsonData['list'] as List;
    List<Child> children = list.map((e) => Child.fromJson(e)).toList();
    return ChildrenResponse(data: children);
  }
}
