import 'dart:convert';

class Scores {
  int id;
  var playerId;
  var courseId;
  var teesId;
  var courseName;
  bool isSkipped;
  var totalScore;
  var clearedCount;
  var holesCount;
  var updatedAt;

  Scores(
      {this.id,
      this.playerId,
      this.courseId,
      this.teesId,
      this.courseName,
      this.isSkipped,
      this.totalScore,
      this.clearedCount,
      this.holesCount,
      this.updatedAt});

  Scores.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playerId = json['player_id'];
    courseId = json['course_id'];
    teesId = json['tees_id'];
    courseName = json['course_name'];
    isSkipped = json['is_skipped'];
    totalScore = json['total_score'];
    clearedCount = json['cleared_count'];
    holesCount = json['holes_count'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['player_id'] = this.playerId;
    data['course_id'] = this.courseId;
    data['tees_id'] = this.teesId;
    data['course_name'] = this.courseName;
    data['is_skipped'] = this.isSkipped;
    data['total_score'] = this.totalScore;
    data['cleared_count'] = this.clearedCount;
    data['holes_count'] = this.holesCount;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

List<Scores> scoreFromJson(jsonData) {
  final data = json.decode(jsonData);
  return List<Scores>.from(data.map((item) => Scores.fromJson(item)));
}
