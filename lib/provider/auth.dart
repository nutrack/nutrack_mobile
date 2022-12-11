import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class AppRequest extends CookieRequest {
  static String get apiUrl =>
      dotenv.env['API_URL'] ??
      (Platform.isAndroid ? "http://10.0.2.2/" : "http://127.0.0.1/");

  @override
  Future<dynamic> login(String url, dynamic data) async {
    return super.login("$apiUrl$url", data);
  }

  @override
  Future<dynamic> get(String url) async {
    return super.get("$apiUrl$url");
  }

  @override
  Future<dynamic> post(String url, dynamic data) async {
    return super.post("$apiUrl$url", data);
  }

  @override
  Future<dynamic> postJson(String url, dynamic data) async {
    return super.postJson("$apiUrl$url", data);
  }

  @override
  Future<dynamic> logout(String url) async {
    return super.logout("$apiUrl$url");
  }
}