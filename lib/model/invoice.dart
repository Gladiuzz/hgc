class Invoice_model {
  Data data;

  Invoice_model({this.data});

  Invoice_model.fromJson(Map<String, dynamic> json) {
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
  int id;
  var orderId;
  Tournament tournament;
  Payment payment;
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
      this.payment,
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
    payment =
        json['payment'] != null ? new Payment.fromJson(json['payment']) : null;
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
    if (this.payment != null) {
      data['payment'] = this.payment.toJson();
    }
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['qty'] = this.qty;
    data['status'] = this.status;
    data['status_display'] = this.statusDisplay;
    data['created_at'] = this.createdAt;
    return data;
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

class Payment {
  String type;
  String status;
  int amount;
  String amountStr;
  String note;
  String paidAt;

  Payment(
      {this.type,
      this.status,
      this.amount,
      this.amountStr,
      this.note,
      this.paidAt});

  Payment.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    status = json['status'];
    amount = json['amount'];
    amountStr = json['amount_str'];
    note = json['note'];
    paidAt = json['paid_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['status'] = this.status;
    data['amount'] = this.amount;
    data['amount_str'] = this.amountStr;
    data['note'] = this.note;
    data['paid_at'] = this.paidAt;
    return data;
  }
}
