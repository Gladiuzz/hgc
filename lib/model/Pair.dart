class Pairs {
  Pair data;

  Pairs({this.data});

  Pairs.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Pair.fromJson(json['data']) : null;
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
    // TODO: implement toString
    return "data: $data";
  }
}

class Pair {
  int id;
  int userId;
  String userName;
  int matchId;
  var tournamentId;
  var tournamentName;
  int golfId;
  String golfName;
  int coursePairId;
  String coursePairName;
  int teesId;
  String teesName;
  var courseRating;
  int slopeRating;
  bool isTournament;
  int pairId;
  String pairName;
  int totalScore;
  int status;
  String statusDisplay;
  var differential;
  var note;
  String createdAt;
  String updatedAt;
  String createdAtDisplay;
  Links links;
  List<Scores> scores;

  Pair(
      {this.id,
      this.userId,
      this.userName,
      this.matchId,
      this.tournamentId,
      this.tournamentName,
      this.golfId,
      this.golfName,
      this.coursePairId,
      this.coursePairName,
      this.teesId,
      this.teesName,
      this.courseRating,
      this.slopeRating,
      this.isTournament,
      this.pairId,
      this.pairName,
      this.totalScore,
      this.status,
      this.statusDisplay,
      this.differential,
      this.note,
      this.createdAt,
      this.updatedAt,
      this.createdAtDisplay,
      this.links,
      this.scores});

  Pair.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userName = json['user_name'];
    matchId = json['match_id'];
    tournamentId = json['tournament_id'];
    tournamentName = json['tournament_name'];
    golfId = json['golf_id'];
    golfName = json['golf_name'];
    coursePairId = json['course_pair_id'];
    coursePairName = json['course_pair_name'];
    teesId = json['tees_id'];
    teesName = json['tees_name'];
    courseRating = json['course_rating'];
    slopeRating = json['slope_rating'];
    isTournament = json['is_tournament'];
    pairId = json['pair_id'];
    pairName = json['pair_name'];
    totalScore = json['total_score'];
    status = json['status'];
    statusDisplay = json['status_display'];
    differential = json['differential'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdAtDisplay = json['created_at_display'];
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    if (json['scores'] != null) {
      scores = new List<Scores>();
      json['scores'].forEach((v) {
        scores.add(new Scores.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['match_id'] = this.matchId;
    data['tournament_id'] = this.tournamentId;
    data['tournament_name'] = this.tournamentName;
    data['golf_id'] = this.golfId;
    data['golf_name'] = this.golfName;
    data['course_pair_id'] = this.coursePairId;
    data['course_pair_name'] = this.coursePairName;
    data['tees_id'] = this.teesId;
    data['tees_name'] = this.teesName;
    data['course_rating'] = this.courseRating;
    data['slope_rating'] = this.slopeRating;
    data['is_tournament'] = this.isTournament;
    data['pair_id'] = this.pairId;
    data['pair_name'] = this.pairName;
    data['total_score'] = this.totalScore;
    data['status'] = this.status;
    data['status_display'] = this.statusDisplay;
    data['differential'] = this.differential;
    data['note'] = this.note;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['created_at_display'] = this.createdAtDisplay;
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    if (this.scores != null) {
      data['scores'] = this.scores.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "data: $id, status: $status";
  }
}

class Links {
  String detail;
  String approve;
  String reject;

  Links({this.detail, this.approve, this.reject});

  Links.fromJson(Map<String, dynamic> json) {
    detail = json['detail'];
    approve = json['approve'];
    reject = json['reject'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['detail'] = this.detail;
    data['approve'] = this.approve;
    data['reject'] = this.reject;
    return data;
  }
}

class Scores {
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
