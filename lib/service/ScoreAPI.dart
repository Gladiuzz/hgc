import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ScoreApi {
  // final String request = "http://192.168.100.9:8000";
  final String request = "https://halogolfclub.com";
  // Client client = Client();
  var token;

  createScoreSkip(data, id_match, id_score) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    final response = await http.put(
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

  createScore(data, id_score, id_match) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    var url =
        "https://halogolfclub.com/api/matches/v2/${id_match}/scores/${id_score}";

    var headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    };

    var request = http.Request('PUT', Uri.parse('${url}'));
    request.body = '''$data''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(request.body);
      // print(await response.stream.bytesToString());
    } else {
      print(data);
    }
  }
}
