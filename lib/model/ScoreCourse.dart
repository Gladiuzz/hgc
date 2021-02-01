class ScoreCourse {
  Data data;

  ScoreCourse({this.data});

  ScoreCourse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return "data ${data}";
  }
}

class Data {
  int id;
  int playerId;
  int courseId;
  int teesId;
  String courseName;
  bool isSkipped;
  int totalScore;
  int clearedCount;
  int holesCount;
  String updatedAt;
  List<Holes> holes;

  Data(
      {this.id,
      this.playerId,
      this.courseId,
      this.teesId,
      this.courseName,
      this.isSkipped,
      this.totalScore,
      this.clearedCount,
      this.holesCount,
      this.updatedAt,
      this.holes});

  Data.fromJson(Map<String, dynamic> json) {
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
    data['player_id'] = this.playerId;
    data['course_id'] = this.courseId;
    data['tees_id'] = this.teesId;
    data['course_name'] = this.courseName;
    data['is_skipped'] = this.isSkipped;
    data['total_score'] = this.totalScore;
    data['cleared_count'] = this.clearedCount;
    data['holes_count'] = this.holesCount;
    data['updated_at'] = this.updatedAt;
    if (this.holes != null) {
      data['holes'] = this.holes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Holes {
  int id;
  int index;
  int par;
  int handicap;
  int distance;
  int score;

  Holes(
      {this.id,
      this.index,
      this.par,
      this.handicap,
      this.distance,
      this.score});

  Holes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    index = json['index'];
    par = json['par'];
    handicap = json['handicap'];
    distance = json['distance'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['index'] = this.index;
    data['par'] = this.par;
    data['handicap'] = this.handicap;
    data['distance'] = this.distance;
    data['score'] = this.score;
    return data;
  }
}
