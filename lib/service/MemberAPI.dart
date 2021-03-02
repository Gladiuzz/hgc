import 'dart:convert';

import 'package:hgc/model/member.dart';
import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';

class MemberApi {
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

  showMember() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    final response = await client.get("$request/api/members/all", headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      print('Berhasil load Member');
      // print(response.body);
      var data = memberFromJson(response.body);
      // print(data);
      return data;
    } else {
      print('Gagal load Member');
      var data = memberFromJson(response.body);
      return data;
    }
  }

  becomeMember(data) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    final response = await client.post(
      "$request/api/members/register",
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
}
