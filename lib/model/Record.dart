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
  Tournament tournament;

  Data({this.match, this.tournament});

  Data.fromJson(Map<String, dynamic> json) {
    match = json['match'] != null ? new Match.fromJson(json['match']) : null;
    tournament = json['tournament'] != null
        ? new Tournament.fromJson(json['tournament'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.match != null) {
      data['match'] = this.match.toJson();
    }
    if (this.tournament != null) {
      data['tournament'] = this.tournament.toJson();
    }
    return data;
  }
}

class Match {
  int id;
  int userId;
  String userName;
  int matchId;
  int tournamentId;
  String tournamentName;
  int golfId;
  String golfName;
  int coursePairId;
  String coursePairName;
  int teesId;
  String teesName;
  double courseRating;
  int slopeRating;
  bool isTournament;
  int pairId;
  String pairName;
  int totalScore;
  int status;
  String statusDisplay;
  double differential;
  Null note;
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

class Tournament {
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
  Match match;

  Tournament(
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
      this.booking,
      this.match});

  Tournament.fromJson(Map<String, dynamic> json) {
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
    match = json['match'] != null ? new Match.fromJson(json['match']) : null;
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
    if (this.match != null) {
      data['match'] = this.match.toJson();
    }
    return data;
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
