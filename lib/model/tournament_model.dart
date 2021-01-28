import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Tournaments {
  int id, organizer_id, golf_id, male_tees_id, female_tees_id, status;
  String name, image, contact_pic, contact_pic_number;
  DateTime date, published_at, payment_deadline;
  Text text;

  Tournaments(
      {this.id,
      this.organizer_id,
      this.golf_id,
      this.male_tees_id,
      this.female_tees_id,
      this.status,
      this.name,
      this.image,
      this.contact_pic,
      this.date,
      this.published_at,
      this.payment_deadline,
      this.text});

  factory Tournaments.fromJson(Map<String, dynamic> data) => Tournaments(
        id: data['id'],
        organizer_id: data['organizer_id'],
        golf_id: data['gold_id'],
        male_tees_id: data['male_tees_id'],
        female_tees_id: data['female_tees_id'],
        status: data['status'],
        name: data['name'],
        image: data['image'],
        contact_pic: data['contact_pic'],
        text: data['text'],
      );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "organizer_id": organizer_id,
      "golf_id": golf_id,
      "male_tees_id": male_tees_id,
      "female_tees_id": female_tees_id,
      "name": name,
      "image": image,
      "text": text,
    };
  }

  // @override
  // // TODO: implement props
  // List<Object> get props => [
  //       id,
  //       organizer_id,
  //       golf_id,
  //       male_tees_id,
  //       female_tees_id,
  //       status,
  //       name,
  //       image,
  //       contact_pic,
  //       date,
  //       published_at,
  //       payment_deadline,
  //       text
  //     ];
}

List<Tournaments> tournamentFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Tournaments>.from(
      data['data'].map((item) => Tournaments.fromJson(item)));
}
