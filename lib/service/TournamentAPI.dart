import 'dart:convert';

import 'package:hgc/model/TournamentLeaderboard.dart';
import 'package:hgc/model/tournamentDetail.dart';
import 'package:hgc/model/tournament_model.dart';
import 'package:hgc/model/verificators.dart';
import 'package:hgc/ui/pages/Tournament/Tournament.dart';
import 'package:hgc/ui/pages/Tournament/TournamentLeaderboard.dart';
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

  showDetailTournament(id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
    final response = await client.get("$request/api/tournaments/${id}",
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });

    if (response.statusCode == 200) {
      // print(response.body);
      var data = json.decode(response.body);

      Tournament_detail value = Tournament_detail.fromJson(data);

      return value;
    } else {
      print('gagal load tournament');
      print(token);
      var data = json.decode(response.body);
      return data;
    }
  }

  verificatorTournament(id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    final response = await client
        .get("$request/api/tournaments/${id}/verificators", headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      // print(response.body);
      var data = json.decode(response.body);

      Verificators value = Verificators.fromJson(data);

      return value;
    } else {
      print('gagal load tournament');
      print(token);
      var data = tournamentFromJson(response.body);
      return data;
    }
  }

  tournamentLeaderboard(id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
    final response = await client
        .get("$request/api/tournaments/${id}/leaderboards", headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      // print(response.body);
      var data = json.decode(response.body);

      Tournament_Leaderboard value = Tournament_Leaderboard.fromJson(data);

      return value;
    } else {
      print('gagal load tournament');
      print(token);
      var data = tournamentFromJson(response.body);
      return data;
    }
  }

  tournamentLeaderboardLink(link) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
    final response = await client.get("$link", headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      // print(response.body);
      var data = json.decode(response.body);

      Tournament_Leaderboard value = Tournament_Leaderboard.fromJson(data);

      return value;
    } else {
      print('gagal load tournament');
      print(token);
      var data = tournamentFromJson(response.body);
      return data;
    }
  }

  payTournament(id, channel) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    final response = await client
        .put("$request/api/tournaments/bookings/${id}/pay", headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    }, body: {
      'payment_channel': channel
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

  payTournamentAfterBook(id_participant) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    final response = await client.put(
        "$request/api/tournaments/bookings/${id_participant}/pay",
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

  cancelBooking(id_participant) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    final response = await client.put(
        "$request/api/tournaments/bookings/${id_participant}/cancel",
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
