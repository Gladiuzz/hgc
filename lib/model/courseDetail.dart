class Course_detail {
  Data data;

  Course_detail({this.data});

  Course_detail.fromJson(Map<String, dynamic> json) {
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
  Location location;
  Contact contact;
  List<Tees> tees;

  Data(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.location,
      this.contact,
      this.tees});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    contact =
        json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
    if (json['tees'] != null) {
      tees = new List<Tees>();
      json['tees'].forEach((v) {
        tees.add(new Tees.fromJson(v));
      });
    }
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
    if (this.tees != null) {
      data['tees'] = this.tees.map((v) => v.toJson()).toList();
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

class Tees {
  int id;
  int golfId;
  String name;

  Tees({this.id, this.golfId, this.name});

  Tees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    golfId = json['golf_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['golf_id'] = this.golfId;
    data['name'] = this.name;
    return data;
  }
}
