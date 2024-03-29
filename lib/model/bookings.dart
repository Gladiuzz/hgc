class Bookings {
  List<Book> data;
  Links links;
  Meta meta;

  Bookings({this.data, this.links, this.meta});

  Bookings.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Book>();
      json['data'].forEach((v) {
        data.add(new Book.fromJson(v));
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

  @override
  String toString() {
    return "data : $data";
  }
}

class Book {
  int id;
  String name;
  String description;
  String image;
  var date;
  String dateTimezone;
  int organizerId;
  int golfId;
  int maleTeesId;
  int femaleTeesId;
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

  Book(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.date,
      this.dateTimezone,
      this.organizerId,
      this.golfId,
      this.maleTeesId,
      this.femaleTeesId,
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

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    date = json['date'];
    dateTimezone = json['date_timezone'];
    organizerId = json['organizer_id'];
    golfId = json['golf_id'];
    maleTeesId = json['male_tees_id'];
    femaleTeesId = json['female_tees_id'];
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
    data['golf_id'] = this.golfId;
    data['male_tees_id'] = this.maleTeesId;
    data['female_tees_id'] = this.femaleTeesId;
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
    return "id : $id, name: $name, date: $date";
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
  int status;
  String statusDisplay;
  String createdAt;

  Booking(
      {this.id,
      this.tournamentId,
      this.userId,
      this.status,
      this.statusDisplay,
      this.createdAt});

  Booking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tournamentId = json['tournament_id'];
    userId = json['user_id'];
    status = json['status'];
    statusDisplay = json['status_display'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tournament_id'] = this.tournamentId;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['status_display'] = this.statusDisplay;
    data['created_at'] = this.createdAt;
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Datas : $id";
  }
}

class Links {
  String first;
  String last;
  Null prev;
  Null next;

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
