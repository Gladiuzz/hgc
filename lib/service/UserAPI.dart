import 'dart:convert';
import 'dart:io';

import 'package:hgc/model/api_return_value.dart';
import 'package:hgc/model/user.dart';
import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';

class UserApi {
  // final String baseURL = "http://192.168.100.9:8000";
  // final String baseURL = "http://192.168.11.15:8000";
  final String baseURL = "https://halogolfclub.com";
  Client client = Client();
  var token;

  getToken(token) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('token', json.encode(token));
    token = localStorage.getString('token');
  }

  register(data) async {
    final response = await client.post(
      "$baseURL/api/auth/register",
      headers: {'Accept': 'application/json'},
      body: data,
    );

    if (response.statusCode == 200) {
      // print(response.body);
      return json.decode(response.body);
    } else {
      // print(json.decode(response.body));
      return json.decode(response.body);
    }
  }

  editProfile(data) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    final response = await client.put(
      "$baseURL/api/account",
      headers: {
        'Accept': 'application/json',
        "Authorization": "Bearer $token",
      },
      body: data,
    );

    if (response.statusCode == 200) {
      // print(response.body);
      return json.decode(response.body);
    } else {
      // print(json.decode(response.body));
      return json.decode(response.body);
    }
  }

  changePassword(data) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    final response = await client.put(
      "$baseURL/api/account/password",
      headers: {
        'Accept': 'application/json',
        "Authorization": "Bearer $token",
      },
      body: data,
    );

    if (response.statusCode == 200) {
      // print(response.body);
      return json.decode(response.body);
    } else {
      // print(json.decode(response.body));
      return json.decode(response.body);
    }
  }

  _setHeaders() =>
      {'Accept': 'application/json', 'Authorization': 'Bearer $token'};

  login(String email, String password) async {
    // var url = "$request/api/auth/login";
    var response = await client.post(
      "$baseURL/api/auth/login",
      headers: {
        'Accept': 'application/json',
      },
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      print(response.body);
      return json.decode(response.body);
    }
  }

  forgotPassword(data) async {
    final response = await client.post(
      "$baseURL/api/auth/password/reset",
      headers: {'Accept': 'application/json'},
      body: data,
    );

    if (response.statusCode == 200) {
      print('berhasil');
      return json.decode(response.body);
    } else {
      print('gagal');
      return json.decode(response.body);
    }
  }

  logout() async {
    var url = "$baseURL/api/auth/logout";
    // await _getToken();
    return await client.delete(url, headers: {'Accept': 'application/json'});
  }

  showUser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
    final response = await client.get("$baseURL/api/account", headers: {
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
}
