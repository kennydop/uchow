import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:uchow/interfaces/interfaces.dart';
import 'package:uchow/services/secure_storage.dart';

class Api {
  static Api _instance = Api._internal();
  Api._internal() {
    _instance = this;
  }
  factory Api() => _instance;

  var server = dotenv.env["SERVER_BASE_URL"]!;
  final SecureStorage secureStorage = SecureStorage();

  final JsonDecoder _decoder = const JsonDecoder();
  final JsonEncoder _encoder = const JsonEncoder();

  Map<String, String> headers = {
    "content-type": "application/json",
    "connection": "keep-alive",
  };
  Map<String, String> cookies = {};

  Future<void> getRefreshToken() async {
    String? ssrefreshToken = await secureStorage.read("refreshToken");
    if (ssrefreshToken != null) {
      print(ssrefreshToken);
      headers["Authorization"] = "Bearer $ssrefreshToken";
    }
  }

  Future refreshToken() async {
    var res = await put(server + "/auth/refreshtoken", body: {});
    if (res["success"] == null) {
      return res;
    } else {
      Get.toNamed("/signin");
    }
  }

  void _updateCookie(http.Response response) {
    String? allSetCookie = response.headers['set-cookie'];
    print(allSetCookie);
    if (allSetCookie != null) {
      var setCookies = allSetCookie.split(',');
      for (var setCookie in setCookies) {
        var cookies = setCookie.split(';');

        for (var cookie in cookies) {
          _setCookie(cookie);
        }
      }

      headers['cookie'] = _generateCookieHeader();
    }
  }

  void _setCookie(String? rawCookie) async {
    if (rawCookie != null) {
      var keyValue = rawCookie.split('=');
      if (keyValue.length == 2) {
        var key = keyValue[0].trim();
        var value = keyValue[1];

        // ignore keys that aren't cookies
        if (key == 'path' || key == 'expires') return;
        if (key == "refreshToken") {
          var edit = value.split(".");
          edit.removeLast();
          value = edit.join(".");
          headers["Authorization"] = "Bearer $value";
        } else {
          cookies[key] = value;
        }
        await secureStorage.write(StorageItem(key: key, value: value));
      }
    }
  }

  String _generateCookieHeader() {
    String cookie = "";

    for (var key in cookies.keys) {
      if (cookie.isNotEmpty) cookie += ";";
      cookie += key + "=" + cookies[key]!;
    }

    return cookie;
  }

  Future<dynamic> get(String url) {
    return http
        .get(Uri.parse(url), headers: headers)
        .then((http.Response response) {
      final String res = response.body;
      if (response.statusCode == 200) _updateCookie(response);
      return _decoder.convert(res);
    });
  }

  Future<dynamic> post(String url, {body, encoding}) {
    return http
        .post(Uri.parse(url),
            body: _encoder.convert(body), headers: headers, encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      if (response.statusCode == 200) _updateCookie(response);
      return _decoder.convert(res);
    });
  }

  Future<dynamic> put(String url, {body, encoding}) {
    return http
        .put(Uri.parse(url),
            body: _encoder.convert(body), headers: headers, encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      if (response.statusCode == 200) _updateCookie(response);
      return _decoder.convert(res);
    });
  }
}
