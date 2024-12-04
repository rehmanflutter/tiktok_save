import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tiktok_save/models/Tiktok.dart';

class TiktokApiClient {
  late String apiUrl;

  TiktokApiClient({required this.apiUrl});

  Future<Tiktok?> fetchTiktokInfo() async {
    if (apiUrl.isEmpty) {
      // If the URL is empty, return null or a default Tiktok object
      return null;
    }

    final response = await http
        .get(Uri.parse("https://www.tikwm.com/api/?url=$apiUrl?hd=1"));

    if (response.statusCode == 200) {
      // Successful response
      return Tiktok.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // Handle error response, you might want to return a default Tiktok object
      return null;
    }
  }
}
