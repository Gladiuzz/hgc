import 'dart:convert';

import 'package:hgc/model/Inbox.dart';
import 'package:hgc/model/Pair.dart';
import 'package:hgc/model/invoice.dart';
import 'package:hgc/model/match.dart';
import 'package:hgc/model/member.dart';
import 'package:hgc/model/tournament_model.dart';
import 'package:hgc/model/user.dart';
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

  rejectMatch(id, data) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    final response =
        await client.put("$request/api/matches/v2/pairs/${id}/reject",
            headers: {
              "Accept": "application/json",
              "Authorization": "Bearer $token",
              "Content-Type": "application/x-www-form-urlencoded"
            },
            body: data);

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

  discardMatch(link) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    final response = await client.get("$link", headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      return data;
    } else {
      var data = json.decode(response.body);

      return data;
    }
  }

  matchApproved(link) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    final response = await client.get("$link", headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      // print("idnya = ${id}");
      var data = json.decode(response.body);

      Pairs value = Pairs.fromJson(data);
      print(value);

      return value;
    } else {
      // print("idnya = ${id}");
      var data = json.decode(response.body);

      Pairs value = Pairs.fromJson(data);

      return value;
    }
  }

  matchNonApproved(link) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    final response = await client.get("$link", headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      // print("idnya = ${id}");
      var data = json.decode(response.body);

      Pairs value = Pairs.fromJson(data);
      print(value);

      return value;
    } else {
      // print("idnya = ${id}");
      var data = json.decode(response.body);

      Pairs value = Pairs.fromJson(data);

      return value;
    }
  }

  matchReject(link) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    final response = await client.get("$link", headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      // print("idnya = ${id}");
      var data = json.decode(response.body);

      Matches value = Matches.fromJson(data);
      print(value);

      return value;
    } else {
      // print("idnya = ${id}");
      var data = json.decode(response.body);

      Matches value = Matches.fromJson(data);

      return value;
    }
  }

  becameMemberHGC(link) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    final response = await client.get("$link", headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      User value = User.fromJson(data['data']);

      print("hah ${value}");
      return value;
    } else {
      print('gagal load user');
      print(token);
      return userFromJson(response.body);
    }
  }

  invitedtoTournament(link) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
    final response = await client.get("$link", headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data);

      Invoice_model value = Invoice_model.fromJson(data);

      return value;
    } else {
      return json.decode(response.body);
    }
  }
}
