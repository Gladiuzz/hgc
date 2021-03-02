class DetailBooking {
  Data data;

  DetailBooking({this.data});

  DetailBooking.fromJson(Map<String, dynamic> json) {
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
    return "Data : $data";
  }
}

class Data {
  int id;
  var orderId;
  Tournament tournament;
  int userId;
  String userName;
  int qty;
  int status;
  String statusDisplay;
  String createdAt;

  Data(
      {this.id,
      this.orderId,
      this.tournament,
      this.userId,
      this.userName,
      this.qty,
      this.status,
      this.statusDisplay,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    tournament = json['tournament'] != null
        ? new Tournament.fromJson(json['tournament'])
        : null;
    userId = json['user_id'];
    userName = json['user_name'];
    qty = json['qty'];
    status = json['status'];
    statusDisplay = json['status_display'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    if (this.tournament != null) {
      data['tournament'] = this.tournament.toJson();
    }
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['qty'] = this.qty;
    data['status'] = this.status;
    data['status_display'] = this.statusDisplay;
    data['created_at'] = this.createdAt;
    return data;
  }

  @override
  String toString() {
    return "id: $id, order_id: $orderId, user_id: $userId";
  }
}

class Tournament {
  int id;
  String name;
  String image;
  int fee;
  String feeStr;
  String date;

  Tournament(
      {this.id, this.name, this.image, this.fee, this.feeStr, this.date});

  Tournament.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    fee = json['fee'];
    feeStr = json['fee_str'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['fee'] = this.fee;
    data['fee_str'] = this.feeStr;
    data['date'] = this.date;
    return data;
  }
}
