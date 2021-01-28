import 'dart:convert';

import 'package:hgc/model/Record.dart';
import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';

class RecordApi {
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

  showRecord() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    final response = await client.get("$request/api/matches/v2/records",
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });

    if (response.statusCode == 200) {
      // print("idnya = ${id}");
      var data = json.decode(response.body);

      Record value = Record.fromJson(data);

      return value;
    } else {
      // print("idnya = ${id}");
      var data = json.decode(response.body);

      Record value = Record.fromJson(data);

      return value;
    }
  }
}
