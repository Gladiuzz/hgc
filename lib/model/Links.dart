class Links {
  String detail;
  String leaderboards;

  Links({this.detail, this.leaderboards});

  Links.fromJson(Map<String, dynamic> json) {
    detail = json['detail'];
    leaderboards = json['leaderboards'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['detail'] = this.detail;
    data['leaderboards'] = this.leaderboards;
    return data;
  }
}
