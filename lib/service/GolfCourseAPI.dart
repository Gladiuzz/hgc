import 'dart:convert';

import 'package:hgc/model/CoursePair.dart';
import 'package:hgc/model/CourseScore.dart';
import 'package:hgc/model/golfCourse.dart';
import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';

class CoursesApi {
  // var request = "https://halogolfclub.com";
  // final String request = "http://192.168.100.9:8000";
  final String request = "https://halogolfclub.com";
  Client client = Client();
  var token;

  getToken(token) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('token', json.encode(token));
    token = localStorage.getString('token');
  }

  showCourses() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
    final response = await client.get("$request/api/golf-courses", headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      print(response.body);
      var data = json.decode(response.body);

      return List<Coursesz>.from(
          data['data'].map((item) => Coursesz.fromJson(item)));
    } else {
      var data = courseFromJson(response.body);
      return data;
    }
  }

  showDetailCourses(id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
    final response = await client.get("$request/api/golf-courses", headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      print(json.decode(response.body)['data']);
      var data = json.decode(response.body);
      var datas = json.decode(data);

      Coursesz value = Coursesz.fromJson(data);

      return value;
    } else {
      var data = json.decode(response.body);
      return data;
    }
  }

  showDetailCourse(id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
    final response = await client.get("$request/api/golf-courses/${id}/courses",
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      CourseScore value = CourseScore.fromJson(data);

      print(value);

      // CoursePair value = CoursePair.fromJson(data['data']);

      return value;
    } else {
      print(response.body);
      var data = json.decode(response.body);

      CoursePair value = CoursePair.fromJson(data['data']);

      return value;
    }
  }

  showCoursePair(int course_id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
    final response = await client
        .get("$request/api/golf-courses/${course_id}/course-pairs", headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      print(response.body);
      var data = coursePairFromJson(response.body);
      return data;
    } else {
      var data = coursePairFromJson(response.body);
      return data;
    }
  }
}
