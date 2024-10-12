// ignore_for_file: await_only_futures, unused_import

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

import 'constants.dart';
import 'storage.dart';

class ReqHttp {
  final Storage _storage = new Storage();
  Map<String, String> requestHeaders = {};
  String _urlAPI = IP_ADDRESS_URL_API;

  Future<void> getHttpHeader() async {
    String? token = await _storage.read("token");
    requestHeaders = {
      'platform': 'MOBILE',
      'Content-type': 'application/json',
      'Authorization': token.toString()
    };
  }

  Future reqLogin(link, param) async {
    try {
      var response = await http.post(
        PROTOCAL == "http" ? Uri.http(_urlAPI, link) : Uri.https(_urlAPI, link),
        headers: {"Content-Type": "application/json; charset=UTF-8"},
        body: convert.jsonEncode(param),
      );
      if (response.statusCode == 200) {
        var body = convert.jsonDecode(response.body);
        return convert.jsonDecode(convert.jsonEncode({
          "success": true,
          "data_total": body.length,
          "data": body,
          "error": ""
        }));
      } else {
        return convert.jsonDecode(convert.jsonEncode({
          "success": false,
          "data_total": 0,
          "data": [],
          "error": "${response.statusCode}."
        }));
      }
    } catch (e) {
      return convert.jsonDecode(convert.jsonEncode({
        "success": false,
        "data_total": 0,
        "data": [],
        "error": e.toString()
      }));
    }
  }

  Future reqPostAPI(link, param) async {
    try {
      String? token = await _storage.read("token");
      var response = await http.post(
        PROTOCAL == "http" ? Uri.http(_urlAPI, link) : Uri.https(_urlAPI, link),
        headers: {
          'Content-type': 'application/x-www-form-urlencoded; charset=utf-8',
          'Authorization': token.toString()
        },
        body: param,
      );
      if (response.statusCode == 200) {
        var body = convert.jsonDecode(response.body);
        return convert.jsonDecode(convert.jsonEncode({
          "success": true,
          "data_total": body.length,
          "data": body,
          "error": ""
        }));
      } else {
        return convert.jsonDecode(convert.jsonEncode({
          "success": false,
          "data_total": 0,
          "data": [],
          "error": "${response.statusCode}."
        }));
      }
    } catch (e) {
      return convert.jsonDecode(convert.jsonEncode({
        "success": false,
        "data_total": 0,
        "data": [],
        "error": e.toString()
      }));
    }
  }

  Future reqGetAPI(link, param) async {
    await getHttpHeader();
    Map<String, dynamic>? queryParameters = {};
    if (param.length > 0) {
      queryParameters = param;
    }

    try {
      var response = await http.get(
        PROTOCAL == "http"
            ? Uri.http(_urlAPI, link, queryParameters)
            : Uri.https(_urlAPI, link, queryParameters),
        headers: requestHeaders,
      );
      if (response.statusCode == 200) {
        var body = convert.jsonDecode(response.body);
        return convert.jsonDecode(convert.jsonEncode({
          "success": true,
          "data_total": body.length,
          "data": body,
          "error": ""
        }));
      } else {
        return convert.jsonDecode(convert.jsonEncode({
          "success": false,
          "data_total": 0,
          "data": [],
          "error": "${response.statusCode}."
        }));
      }
    } catch (e) {
      return convert.jsonDecode(convert.jsonEncode({
        "success": false,
        "data_total": 0,
        "data": [],
        "error": e.toString()
      }));
    }
  }
}

class StoreVersionAndUrl {
  final String storeVersion;
  final String storeUrl;
  final error;
  StoreVersionAndUrl(this.storeVersion, this.storeUrl, this.error);
}
