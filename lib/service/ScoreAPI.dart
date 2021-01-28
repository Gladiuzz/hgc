import 'dart:convert';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScoreApi {
  // final String request = "http://192.168.100.9:8000";
  final String request = "https://halogolfclub.com";
  Client client = Client();
  var token;

  createScoreSkip(data, id_match, id_score) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    final response = await client.put(
      "$request/api/matches/v2/${id_match}/scores/${id_score}/skip",
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: data,
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
}
