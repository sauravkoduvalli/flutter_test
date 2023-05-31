import 'dart:convert';

import 'package:first_project/model/album_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<Album> fetchAlbum() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/albums/1");

    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed to fetch Data');
    }
  }
}
