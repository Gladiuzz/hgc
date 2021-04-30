import 'dart:convert';

class Verificators {
  List<Verificators_tournament> data;
  Links links;
  Meta meta;

  Verificators({this.data, this.links, this.meta});

  Verificators.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Verificators_tournament>();
      json['data'].forEach((v) {
        data.add(new Verificators_tournament.fromJson(v));
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

class Verificators_tournament {
  int id;
  String name;
  String email;
  int typeId;
  String type;
  var memberId;
  var handicap;
  var image;
  String qrCode;
  int status;
  String statusDisplay;

  Verificators_tournament(
      {this.id,
      this.name,
      this.email,
      this.typeId,
      this.type,
      this.memberId,
      this.handicap,
      this.image,
      this.qrCode,
      this.status,
      this.statusDisplay});

  Verificators_tournament.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    typeId = json['type_id'];
    type = json['type'];
    memberId = json['member_id'];
    handicap = json['handicap'];
    image = json['image'];
    qrCode = json['qr_code'];
    status = json['status'];
    statusDisplay = json['status_display'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['type_id'] = this.typeId;
    data['type'] = this.type;
    data['member_id'] = this.memberId;
    data['handicap'] = this.handicap;
    data['image'] = this.image;
    data['qr_code'] = this.qrCode;
    data['status'] = this.status;
    data['status_display'] = this.statusDisplay;
    return data;
  }

  @override
  String toString() {
    return "id: $id, name: $name";
  }
}

List<Verificators_tournament> vertournament(jsonData) {
  final data = json.decode(jsonData);
  print("yadf");
  return List<Verificators_tournament>.from(
      data.map((item) => Verificators_tournament.fromJson(item)));
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

List<Verificators_tournament> verificatorFromJson(jsonData) {
  final data = json.decode(jsonData);
  return List<Verificators_tournament>.from(
      data['data'].map((item) => Verificators_tournament.fromJson(item)));
}
