class Tournament_detail {
  Data data;

  Tournament_detail({this.data});

  Tournament_detail.fromJson(Map<String, dynamic> json) {
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
  String name;
  String description;
  String image;
  String date;
  String dateTimezone;
  int organizerId;
  String organizerName;
  int golfId;
  String golfName;
  Tees tees;
  Contact contact;
  int handicapLimit;
  int fee;
  String feeStr;
  String paymentDeadline;
  String paymentDeadlineTimezone;
  Attendance attendance;
  bool isBookingable;
  bool isPaymentOpen;
  Booking booking;

  Data(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.date,
      this.dateTimezone,
      this.organizerId,
      this.organizerName,
      this.golfId,
      this.golfName,
      this.tees,
      this.contact,
      this.handicapLimit,
      this.fee,
      this.feeStr,
      this.paymentDeadline,
      this.paymentDeadlineTimezone,
      this.attendance,
      this.isBookingable,
      this.isPaymentOpen,
      this.booking});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    date = json['date'];
    dateTimezone = json['date_timezone'];
    organizerId = json['organizer_id'];
    organizerName = json['organizer_name'];
    golfId = json['golf_id'];
    golfName = json['golf_name'];
    tees = json['tees'] != null ? new Tees.fromJson(json['tees']) : null;
    contact =
        json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
    handicapLimit = json['handicap_limit'];
    fee = json['fee'];
    feeStr = json['fee_str'];
    paymentDeadline = json['payment_deadline'];
    paymentDeadlineTimezone = json['payment_deadline_timezone'];
    attendance = json['attendance'] != null
        ? new Attendance.fromJson(json['attendance'])
        : null;
    isBookingable = json['is_bookingable'];
    isPaymentOpen = json['is_payment_open'];
    booking =
        json['booking'] != null ? new Booking.fromJson(json['booking']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['date'] = this.date;
    data['date_timezone'] = this.dateTimezone;
    data['organizer_id'] = this.organizerId;
    data['organizer_name'] = this.organizerName;
    data['golf_id'] = this.golfId;
    data['golf_name'] = this.golfName;
    if (this.tees != null) {
      data['tees'] = this.tees.toJson();
    }
    if (this.contact != null) {
      data['contact'] = this.contact.toJson();
    }
    data['handicap_limit'] = this.handicapLimit;
    data['fee'] = this.fee;
    data['fee_str'] = this.feeStr;
    data['payment_deadline'] = this.paymentDeadline;
    data['payment_deadline_timezone'] = this.paymentDeadlineTimezone;
    if (this.attendance != null) {
      data['attendance'] = this.attendance.toJson();
    }
    data['is_bookingable'] = this.isBookingable;
    data['is_payment_open'] = this.isPaymentOpen;
    if (this.booking != null) {
      data['booking'] = this.booking.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return "booking: $booking";
  }
}

class Tees {
  Male male;
  Male female;

  Tees({this.male, this.female});

  Tees.fromJson(Map<String, dynamic> json) {
    male = json['male'] != null ? new Male.fromJson(json['male']) : null;
    female = json['female'] != null ? new Male.fromJson(json['female']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.male != null) {
      data['male'] = this.male.toJson();
    }
    if (this.female != null) {
      data['female'] = this.female.toJson();
    }
    return data;
  }
}

class Male {
  int id;
  String name;

  Male({this.id, this.name});

  Male.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Contact {
  String pic;
  String phoneNumber;

  Contact({this.pic, this.phoneNumber});

  Contact.fromJson(Map<String, dynamic> json) {
    pic = json['pic'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pic'] = this.pic;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}

class Attendance {
  int waitingListCount;
  int waitingLimit;
  int reservesCount;
  int reserveLimit;

  Attendance(
      {this.waitingListCount,
      this.waitingLimit,
      this.reservesCount,
      this.reserveLimit});

  Attendance.fromJson(Map<String, dynamic> json) {
    waitingListCount = json['waiting_list_count'];
    waitingLimit = json['waiting_limit'];
    reservesCount = json['reserves_count'];
    reserveLimit = json['reserve_limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['waiting_list_count'] = this.waitingListCount;
    data['waiting_limit'] = this.waitingLimit;
    data['reserves_count'] = this.reservesCount;
    data['reserve_limit'] = this.reserveLimit;
    return data;
  }
}

class Booking {
  int id;
  int tournamentId;
  int userId;
  String orderId;
  int status;
  String statusDisplay;
  String createdAt;

  Booking(
      {this.id,
      this.tournamentId,
      this.userId,
      this.orderId,
      this.status,
      this.statusDisplay,
      this.createdAt});

  Booking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tournamentId = json['tournament_id'];
    userId = json['user_id'];
    orderId = json['order_id'];
    status = json['status'];
    statusDisplay = json['status_display'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tournament_id'] = this.tournamentId;
    data['user_id'] = this.userId;
    data['order_id'] = this.orderId;
    data['status'] = this.status;
    data['status_display'] = this.statusDisplay;
    data['created_at'] = this.createdAt;
    return data;
  }
}
