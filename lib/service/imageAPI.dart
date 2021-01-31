import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ImageAPI {
  final String baseURL = "https://halogolfclub.com";
  var token;

  updateAvatar(image) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');

    var request = http.MultipartRequest(
        'POST', Uri.parse('https://halogolfclub.com/api/account/image'));
    request.files.add(await http.MultipartFile.fromPath('image', image));

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
