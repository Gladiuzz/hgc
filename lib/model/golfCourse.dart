import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hgc/ui/pages/Courses_detail/Course.dart';
import 'package:hgc/ui/pages/Courses_detail/Courses.dart';

class Courses {
  List<Coursesz> data;
  Links links;
  Meta meta;

  Courses({this.data, this.links, this.meta});

  Courses.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Coursesz>();
      json['data'].forEach((v) {
        data.add(new Coursesz.fromJson(v));
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

class Coursesz {
  int id;
  String name;
  String description;
  String image;
  Location location;
  Contact contact;

  Coursesz(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.location,
      this.contact});

  Coursesz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    contact =
        json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.contact != null) {
      data['contact'] = this.contact.toJson();
    }
    return data;
  }
}

class Location {
  int countryId;
  String countryName;
  int provinceId;
  String provinceName;
  int cityId;
  String cityName;
  String address;
  String latitude;
  String longitude;

  Location(
      {this.countryId,
      this.countryName,
      this.provinceId,
      this.provinceName,
      this.cityId,
      this.cityName,
      this.address,
      this.latitude,
      this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    countryId = json['country_id'];
    countryName = json['country_name'];
    provinceId = json['province_id'];
    provinceName = json['province_name'];
    cityId = json['city_id'];
    cityName = json['city_name'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_id'] = this.countryId;
    data['country_name'] = this.countryName;
    data['province_id'] = this.provinceId;
    data['province_name'] = this.provinceName;
    data['city_id'] = this.cityId;
    data['city_name'] = this.cityName;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class Contact {
  String phoneNumber;
  String email;
  String websiteUrl;

  Contact({this.phoneNumber, this.email, this.websiteUrl});

  Contact.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    email = json['email'];
    websiteUrl = json['website_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['website_url'] = this.websiteUrl;
    return data;
  }
}

class Links {
  String first;
  String last;
  Null prev;
  String next;

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

List<Courses> courseFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Courses>.from(data['data'].map((item) => Courses.fromJson(item)));
}
