class Record {
  Data data;

  Record({this.data});

  Record.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  Match match;
  var tournament;

  Data({this.match, this.tournament});

  Data.fromJson(Map<String, dynamic> json) {
    match = json['match'] != null ? new Match.fromJson(json['match']) : null;
    tournament = json['tournament'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.match != null) {
      data['match'] = this.match.toJson();
    }
    data['tournament'] = this.tournament;
    return data;
  }
}

class Match {
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

  Match(
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
      this.links});

  Match.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class Links {
  String detail;

  Links({this.detail});

  Links.fromJson(Map<String, dynamic> json) {
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['detail'] = this.detail;
    return data;
  }
}
