import 'dart:convert';
import 'package:hgc/model/bookDetail.dart';
import 'package:hgc/model/bookings.dart';
import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';

class BookingApi {
  final String request = "https://halogolfclub.com";
  Client client = Client();
  var token;

  showBookedTournament() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');

    final response = await client.get("$request/api/tournaments/bookings",
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      Bookings value = Bookings.fromJson(data);

      // CoursePair value = CoursePair.fromJson(data['data']);

      return value;
    } else {
      print(response.body);
      var data = json.decode(response.body);

      Bookings value = Bookings.fromJson(data);

      return value;
    }

    // if (response.statusCode == 200) {
    //   print(response.body);
    //   var data = json.decode(response.body);

    //   //  List<Matches> value = Matches.fromJson(data['data']);

    //   return List<Matches>.from(
    //       data['data'].map((item) => Matches.fromJson(item)));
    // } else {
    //   print(response.body);
    //   var data = matchFromJson(response.body);
    //   return data;
    // }
  }

  bookingTournament(id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    final response = await client.post(
      "$request/api/tournaments/${id}/book",
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
      var datas = json.decode(response.body);
      return datas;
    } else {
      print(response.body);
      return json.decode(response.body);
    }
  }

  bookedDetail(id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');

    final response = await client.get("$request/api/tournaments/bookings/${id}",
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      DetailBooking value = DetailBooking.fromJson(data);

      // CoursePair value = CoursePair.fromJson(data['data']);

      return value;
    } else {
      print(response.body);
      var data = json.decode(response.body);

      DetailBooking value = DetailBooking.fromJson(data);

      return value;
    }

    // if (response.statusCode == 200) {
    //   print(response.body);
    //   var data = json.decode(response.body);

    //   //  List<Matches> value = Matches.fromJson(data['data']);

    //   return List<Matches>.from(
    //       data['data'].map((item) => Matches.fromJson(item)));
    // } else {
    //   print(response.body);
    //   var data = matchFromJson(response.body);
    //   return data;
    // }
  }
}
