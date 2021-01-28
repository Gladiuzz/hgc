import 'dart:convert';

import 'package:hgc/model/Inbox.dart';
import 'package:hgc/model/Pair.dart';
import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';

class InboxAPI {
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

  showInbox() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
    final response = await client.get("$request/api/inbox", headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      print(data);

      // Inbox value = Inbox.fromJson(data['data']);

      return List<Inboxs>.from(
          data['data'].map((item) => Inboxs.fromJson(item)));

      // return value;
    } else {
      var data = json.decode(response.body);

      print(data);

      // CoursePair value = CoursePair.fromJson(data['data']);

      return List<Inboxs>.from(
          data['data'].map((item) => Inboxs.fromJson(item)));
    }
  }

  getInboxDetail(int id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    final response = await client.get("$request/api/matches/v2/pairs/${id}",
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });

    if (response.statusCode == 200) {
      print("idnya = ${id}");
      var data = json.decode(response.body);

      Pairs value = Pairs.fromJson(data);
      print(value);

      return value;
    } else {
      print("idnya = ${id}");
      var data = json.decode(response.body);

      Pairs value = Pairs.fromJson(data);

      return value;
    }
  }

  approveMatch(id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    final response = await client
        .put("$request/api/matches/v2/pairs/${id}/approve", headers: {
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
