import 'dart:convert';

class Member {
  var id;
  int type_id, phone_number, gender;
  String name, email, password, image, type;

  Member(
      {this.id,
      this.type_id,
      this.phone_number,
      this.name,
      this.email,
      this.password,
      this.gender,
      this.type,
      this.image});

  factory Member.fromJson(Map<String, dynamic> data) => Member(
        id: data["id"],
        type_id: data["type_id"],
        phone_number: data["phone_number"],
        name: data["name"],
        email: data["email"],
        password: data["password"],
        gender: data["gender"],
        image: data["image"],
        type: data["type"],
      );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "type_id": type_id,
      "phone_number": phone_number,
      "name": name,
      "email": email,
      "password": password,
      "image": image,
      "gender": gender,
      "type": type,
    };
  }

  @override
  String toString() {
    return 'id_user: $id, username:$name,email:$email, password:$password,';
  }

  // @override
  // // TODO: implement props
  // List<Object> get props =>
  //     [user_id, member_id, phone_number, name, email, password, gender, image];
}

List<Member> memberFromJson(jsonData) {
  final data = json.decode(jsonData);
  print(data['data']);
  return List<Member>.from(data['data'].map((item) => Member.fromJson(item)));
}
