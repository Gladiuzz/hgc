import 'dart:convert';

import 'package:hgc/model/tournament_model.dart';
import 'package:hgc/ui/pages/Tournament/Tournament.dart';
import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';

class TournamentApi {
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

  showTournament() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
    final response = await client.get("$request/api/tournaments/", headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      // print(response.body);
      var data = tournamentFromJson(response.body);
      return data;
    } else {
      print('gagal load tournament');
      print(token);
      var data = tournamentFromJson(response.body);
      return data;
    }
  }
}
