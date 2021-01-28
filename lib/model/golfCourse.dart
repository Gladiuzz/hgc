import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hgc/ui/pages/Courses_detail/Course.dart';
import 'package:hgc/ui/pages/Courses_detail/Courses.dart';

class Courses {
  int id, country_id, province_id, city_id;
  String name,
      image,
      contact_phone_number,
      contact_email,
      website_url,
      city_name;
  String description, address;

  Courses({
    this.id,
    this.country_id,
    this.province_id,
    this.city_id,
    this.name,
    this.image,
    this.contact_phone_number,
    this.contact_email,
    this.website_url,
    this.description,
    this.address,
    this.city_name,
  });

  factory Courses.fromJson(Map<String, dynamic> map) => Courses(
      id: map["id"],
      country_id: map['location']["country_id"],
      province_id: map['location']["province_id"],
      city_id: map['location']["city_id"],
      name: map["name"],
      image: map["image"],
      contact_phone_number: map['contact']["phone_number"],
      contact_email: map['contact']["email"],
      website_url: map['contact']["website_url"],
      city_name: map['location']['city_name'],
      address: map['location']['address']);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "country_id": country_id,
      "province_id": province_id,
      "city_id": city_id,
      "name": name,
      "image": image,
      "contact_phone_number": contact_phone_number,
      "contact_email": contact_email,
      "website_url": website_url,
      "city_name": city_name,
      "address": address,
    };
  }

  @override
  String toString() {
    return 'id:$id,name:$name';
  }
}

List<Courses> courseFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Courses>.from(data['data'].map((item) => Courses.fromJson(item)));
}
