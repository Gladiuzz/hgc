import 'dart:ffi';

class Tees {
  int id;
  int golfId;
  String name;
  var courseRating;
  var slopeRating;
  var distance;

  Tees(
      {this.id,
      this.golfId,
      this.name,
      this.courseRating,
      this.slopeRating,
      this.distance});

  Tees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    golfId = json['golf_id'];
    name = json['name'];
    courseRating = json['course_rating'];
    slopeRating = json['slope_rating'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['golf_id'] = this.golfId;
    data['name'] = this.name;
    data['course_rating'] = this.courseRating;
    data['slope_rating'] = this.slopeRating;
    data['distance'] = this.distance;
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Cr: $courseRating, name: $name';
  }
}
