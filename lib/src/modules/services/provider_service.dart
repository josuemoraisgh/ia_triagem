import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class ProviderService with Disposable {
  var client = http.Client();
  Future<Map<String, dynamic>?> get(String baseUrl,
      {String bodyUrl = "", Map<String, dynamic>? queryParameters}) async {
    final http.Response response;
    try {
      if (queryParameters != null) {
        queryParameters.removeWhere((key, value) => value == null);
      }
      response = await client.get(
        Uri.https(baseUrl, bodyUrl, queryParameters),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'connection': 'keep-alive',
        },
      );
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      debugPrint("ProviderService - get - $e");
      return null;
    }
  }

  @override
  void dispose() {
    client.close();
  }
}
