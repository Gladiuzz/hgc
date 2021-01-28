import 'dart:convert';

import 'dart:core';

import 'package:equatable/equatable.dart';

class User {
  int id;
  String name;
  String email;
  int typeId;
  String type;
  String memberId;
  String phoneNumber;
  int gender;
  var birthDate;
  String image;
  var handicap;
  String companyName;
  String socialInstagram;
  var membership;
  QrCode links;

  User(
      {this.id,
      this.name,
      this.email,
      this.typeId,
      this.type,
      this.memberId,
      this.phoneNumber,
      this.gender,
      this.birthDate,
      this.image,
      this.handicap,
      this.companyName,
      this.socialInstagram,
      this.membership,
      this.links});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    typeId = json['type_id'];
    type = json['type'];
    memberId = json['member_id'];
    phoneNumber = json['phone_number'];
    gender = json['gender'];
    birthDate = json['birth_date'];
    image = json['image'];
    handicap = json['handicap'];
    companyName = json['company_name'];
    socialInstagram = json['social_instagram'];
    membership = json['membership'];
    links = json['links'] != null ? new QrCode.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['type_id'] = this.typeId;
    data['type'] = this.type;
    data['member_id'] = this.memberId;
    data['phone_number'] = this.phoneNumber;
    data['gender'] = this.gender;
    data['birth_date'] = this.birthDate;
    data['image'] = this.image;
    data['handicap'] = this.handicap;
    data['company_name'] = this.companyName;
    data['social_instagram'] = this.socialInstagram;
    data['membership'] = this.membership;
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'id: $id, name: $name, email: $email, type: $type, handicap: $handicap, image: $image';
  }
}

class QrCode {
  String qrCode;

  QrCode({this.qrCode});

  QrCode.fromJson(Map<String, dynamic> json) {
    qrCode = json['qr_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qr_code'] = this.qrCode;
    return data;
  }
}

List<User> userFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<User>.from(data.map((item) => User.fromJson(item)));
}
