import 'package:hgc/model/Tees.dart';

class CourseScore {
  List<CourseScoreData> data;

  CourseScore({this.data});

  CourseScore.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<CourseScoreData>();
      json['data'].forEach((v) {
        data.add(new CourseScoreData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return "data: $data";
  }
}

class CourseScoreData {
  int id;
  int golfId;
  String name;
  List<Holes> holes;

  CourseScoreData({this.id, this.golfId, this.name, this.holes});

  CourseScoreData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    golfId = json['golf_id'];
    name = json['name'];
    if (json['holes'] != null) {
      holes = new List<Holes>();
      json['holes'].forEach((v) {
        holes.add(new Holes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['golf_id'] = this.golfId;
    data['name'] = this.name;
    if (this.holes != null) {
      data['holes'] = this.holes.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "id: $id";
  }
}

class Holes {
  int id;
  int courseId;
  int index;
  int par;
  int handicap;
  List<Tees> tees;

  Holes(
      {this.id, this.courseId, this.index, this.par, this.handicap, this.tees});

  Holes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['course_id'];
    index = json['index'];
    par = json['par'];
    handicap = json['handicap'];
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
    data['course_id'] = this.courseId;
    data['index'] = this.index;
    data['par'] = this.par;
    data['handicap'] = this.handicap;
    if (this.tees != null) {
      data['tees'] = this.tees.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "index: $index";
  }
}
