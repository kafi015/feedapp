import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart' as http;

class NetworkUtils {
  Future<dynamic> getMethod(String url) async {
    try {
      final http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        print("Unauthorized");
      } else {
        print("Something went wrong ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> postMethod(String url, {Map<String, String>? body , VoidCallback? onunauthorized}) async {
    try {
      final http.Response response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(body));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if(onunauthorized != null) {
          onunauthorized();
        }
      } else {
        print("Something went wrong");
      }
    } catch (e) {
      print(e);
    }
  }
}
