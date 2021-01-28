import 'dart:convert';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HandicapAPI {
  final String request = "https://halogolfclub.com";
  Client client = Client();
  var token;

  getToken(token) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('token', json.encode(token));
    token = localStorage.getString('token');
  }

  showHandicap() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    final response = await client.get("$request/api/matches/v2/handicap/",
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });

    if (response.statusCode == 200) {
      print(response.body);
      var data = json.decode(response.body);
      return data;
    } else {
      print(response.body);
      var data = json.decode(response.body);
      return data;
    }
  }
}
