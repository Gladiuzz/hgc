import 'dart:convert';
import 'dart:ffi';

import 'package:hgc/model/Tees.dart';

class CoursePair {
  int id;
  int golfId;
  int courseId;
  int coursePairId;
  String name;
  List<Tees> tees;

  CoursePair(
      {this.id,
      this.golfId,
      this.courseId,
      this.coursePairId,
      this.name,
      this.tees});

  CoursePair.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    golfId = json['golf_id'];
    courseId = json['course_id'];
    coursePairId = json['course_pair_id'];
    name = json['name'];
    if (json['tees'] != null) {
      tees = new List<Tees>();
      json['tees'].forEach((v) {
        tees.add(new Tees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['golf_id'] = this.golfId;
    data['course_id'] = this.courseId;
    data['course_pair_id'] = this.coursePairId;
    data['name'] = this.name;
    if (this.tees != null) {
      data['tees'] = this.tees.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

List<CoursePair> coursePairFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<CoursePair>.from(
      data['data'].map((item) => CoursePair.fromJson(item)));
}
