class Tournament_Leaderboard {
  List<Leaderboard> data;
  Links links;
  Meta meta;

  Tournament_Leaderboard({this.data, this.links, this.meta});

  Tournament_Leaderboard.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Leaderboard>();
      json['data'].forEach((v) {
        data.add(new Leaderboard.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    return data;
  }
}

class Leaderboard {
  int id;
  int matchId;
  int userId;
  String userName;
  int pairId;
  String pairName;
  int totalScore;
  int clearedScoreHolesCount;
  int status;
  String statusDisplay;
  String note;
  String createdAt;
  String updatedAt;
  String createdAtDisplay;

  Leaderboard(
      {this.id,
      this.matchId,
      this.userId,
      this.userName,
      this.pairId,
      this.pairName,
      this.totalScore,
      this.clearedScoreHolesCount,
      this.status,
      this.statusDisplay,
      this.note,
      this.createdAt,
      this.updatedAt,
      this.createdAtDisplay});

  Leaderboard.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    matchId = json['match_id'];
    userId = json['user_id'];
    userName = json['user_name'];
    pairId = json['pair_id'];
    pairName = json['pair_name'];
    totalScore = json['total_score'];
    clearedScoreHolesCount = json['cleared_score_holes_count'];
    status = json['status'];
    statusDisplay = json['status_display'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdAtDisplay = json['created_at_display'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['match_id'] = this.matchId;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['pair_id'] = this.pairId;
    data['pair_name'] = this.pairName;
    data['total_score'] = this.totalScore;
    data['cleared_score_holes_count'] = this.clearedScoreHolesCount;
    data['status'] = this.status;
    data['status_display'] = this.statusDisplay;
    data['note'] = this.note;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['created_at_display'] = this.createdAtDisplay;
    return data;
  }
}

class Links {
  String first;
  String last;
  Null prev;
  String next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class Meta {
  int currentPage;
  int from;
  int lastPage;
  String path;
  int perPage;
  int to;
  int total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}
