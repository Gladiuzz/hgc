import 'dart:convert';

import 'package:hgc/model/Pair.dart';
import 'package:hgc/model/api_return_value.dart';
import 'package:hgc/model/match.dart';
import 'package:hgc/model/member.dart';
import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';

class MatchApi {
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

  createMatch(data) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    final response = await client.post(
      "$request/api/matches/v2",
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
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

  showMatchApproved() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    final response = await client.get("$request/api/matches/v2/pairs",
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });

    if (response.statusCode == 200) {
      print(response.body);
      var data = json.decode(response.body);

      // Pairs value = Pairs.fromJson(data['data']);
      // return value;

      return List<Pair>.from(data['data'].map((item) => Pair.fromJson(item)));
    } else {
      print(response.body);
      var data = matchFromJson(response.body);
      return data;
    }
  }

  showMatch() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    final response = await client.get("$request/api/matches/v2", headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      print(response.body);
      var data = json.decode(response.body);

      //  List<Matches> value = Matches.fromJson(data['data']);

      return List<Matches>.from(
          data['data'].map((item) => Matches.fromJson(item)));
    } else {
      print(response.body);
      var data = matchFromJson(response.body);
      return data;
    }
  }

  showMatchDetail(int id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    final response = await client.get("$request/api/matches/v2/${id}",
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });

    if (response.statusCode == 200) {
      print("idnya = ${id}");
      var data = json.decode(response.body);

      Matches value = Matches.fromJson(data['data']);

      return value;
    } else {
      print(response.body);
      var data = matchFromJson(response.body);
    }
  }

  discardMatch(id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    final response = await client
        .delete("$request/api/matches/v2/${id}/discard", headers: {
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

  submitMatch(id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    final response = await client.put("$request/api/matches/v2/${id}/submit",
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
