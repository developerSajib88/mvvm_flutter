import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mvvm_flutter/data/network/network_log.dart';


class NetworkApiMethods {


  /// This class I am create for
  /// Separate http method as like get, post, update, delete and fetch
  /// from api service. And for separate part by part for re-use in api service

  static Future<Map<String, dynamic>?> get(String url) async {
    try {
      final response = await http.get(Uri.parse(url),
          headers: {"Content-Type": "application/json"}
      ).timeout(const Duration(seconds: 60));

      responseReport(method: "GET", response: response.body.toString());

      if (response.statusCode == 200) {

        return jsonDecode(response.body);

      } else if (response.statusCode == 401) {

        CustomLog.customPrinter("🐞🐞🐞 Error Alert 401 🐞🐞🐞");
        CustomLog.customPrinter("Hitted Here!**|token-expire|******* $url");
        return null;

      } else if (response.statusCode == 204) {
        CustomLog.customPrinter("🐞🐞🐞 Error Alert 204 🐞🐞🐞");
        return null;
      } else if (response.statusCode == 406) {
        CustomLog.customPrinter("🐞🐞🐞 Error Alert 406 🐞🐞🐞'");
        return null;
      } else if (response.statusCode == 400) {
        CustomLog.customPrinter(
            "🐞🐞🐞 Error Alert 400 || ${response.statusCode} 🐞🐞🐞");
        return null;
      } else if (response.statusCode != 200) {
        CustomLog.customPrinter("🐞🐞🐞 Error Alert 400 || ${response.statusCode} 🐞🐞🐞");
        return null;
      } else {
        CustomLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");

        CustomLog.customPrinter("unknown error hitted in status code ${jsonDecode(response.body)}");
        return null;
      }
    } on SocketException {
      CustomLog.customPrinter("🐞🐞🐞 Error Alert on Socket Exception 🐞🐞🐞");
      return null;
    }
  }



  /// This function for checking after api calling api url, body, and api method
  prevReport(
      {required String method,
        required String url,
        Map<String, dynamic>? body}) {
    print("|-------");
    print("|🚀  📡  🚀|");

    CustomLog.customPrinterYellow("[METHOD] : $method");
    CustomLog.customPrinterYellow("[url] : $url");
    CustomLog.customPrinterWhite("[body] : $body");
    print("|🚀|");
    print("|-------");
  }


  /// This function for checking
  /// after api calling api url, body, and Api response from server
  static responseReport({
    required String method,
    required String response,
  }) {
    print("|-------");
    print("|🌱|");
    CustomLog.customPrinterGreen("[METHOD] : $method");
    CustomLog.customPrinterGreen("[url] : $response");
    print("|🌱|");
    print("|-------");
  }





}