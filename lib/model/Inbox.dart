class Inboxs {
  int id;
  var userId;
  String type;
  String message;
  bool isRead;
  Data data;
  String linkContext;
  String createdAt;

  Inboxs(
      {this.id,
      this.userId,
      this.type,
      this.message,
      this.isRead,
      this.data,
      this.linkContext,
      this.createdAt});

  Inboxs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    type = json['type'];
    message = json['message'];
    isRead = json['is_read'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    linkContext = json['link_context'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['type'] = this.type;
    data['message'] = this.message;
    data['is_read'] = this.isRead;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['link_context'] = this.linkContext;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Data {
  int id;
  var matchId;
  var userId;
  var pairId;
  var totalScore;
  var status;
  String statusDisplay;
  Null note;
  String userName;
  String pairName;
  String target;

  Data(
      {this.id,
      this.matchId,
      this.userId,
      this.pairId,
      this.totalScore,
      this.status,
      this.statusDisplay,
      this.note,
      this.userName,
      this.pairName,
      this.target});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    matchId = json['match_id'];
    userId = json['user_id'];
    pairId = json['pair_id'];
    totalScore = json['total_score'];
    status = json['status'];
    statusDisplay = json['status_display'];
    note = json['note'];
    userName = json['user_name'];
    pairName = json['pair_name'];
    target = json['target'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['match_id'] = this.matchId;
    data['user_id'] = this.userId;
    data['pair_id'] = this.pairId;
    data['total_score'] = this.totalScore;
    data['status'] = this.status;
    data['status_display'] = this.statusDisplay;
    data['note'] = this.note;
    data['user_name'] = this.userName;
    data['pair_name'] = this.pairName;
    data['target'] = this.target;
    return data;
  }
}
