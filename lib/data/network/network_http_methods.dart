import 'dart:convert';
import 'dart:io';
import 'dart:async';


import 'package:http/http.dart' as http;
import 'package:mvvm_flutter/data/network/base_http_methods.dart';
import 'package:mvvm_flutter/data/network/network_log.dart';


class NetworkHttpMethods implements BaseHttpMethods {

  /// This class I am create for
  /// Separate http method as like get, post, update, delete and fetch
  /// from api service. And for separate part by part for re-use in api service


  // Get Method
  @override
  Future<Map<String, dynamic>?> get(String url) async {
    try {
      final response = await http.get(Uri.parse(url),
          headers: {"Content-Type": "application/json"}
      ).timeout(const Duration(seconds: 60));

      responseReport(method: "GET", response: response.body.toString());

      if (response.statusCode == 200) {

        return jsonDecode(response.body);

      } else if (response.statusCode == 401) {

        NetworkLog.customPrinter("🐞🐞🐞 Error Alert 401 🐞🐞🐞");
        NetworkLog.customPrinter("Hit Here!**|token-expire|******* $url");
        return null;

      } else if (response.statusCode == 204) {
        NetworkLog.customPrinter("🐞🐞🐞 Error Alert 204 🐞🐞🐞");
        return null;
      } else if (response.statusCode == 406) {
        NetworkLog.customPrinter("🐞🐞🐞 Error Alert 406 🐞🐞🐞");
        return null;
      } else if (response.statusCode == 400) {
        NetworkLog.customPrinter(
            "🐞🐞🐞 Error Alert 400 || ${response.statusCode} 🐞🐞🐞");
        return null;
      } else if (response.statusCode != 200) {
        NetworkLog.customPrinter("🐞🐞🐞 Error Alert 400 || ${response.statusCode} 🐞🐞🐞");
        return null;
      } else {
        NetworkLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");

        NetworkLog.customPrinter("unknown error hit in status code ${jsonDecode(response.body)}");
        return null;
      }
    } on SocketException {
      NetworkLog.customPrinter("🐞🐞🐞 Error Alert on Socket Exception 🐞🐞🐞");
      return null;
    } on TimeoutException {
      NetworkLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");

      NetworkLog.customPrinter("Time out exception $url");
      return null;
    } on http.ClientException catch (err, stackTrace) {
      NetworkLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
      NetworkLog.customPrinter("client exception hit");
      NetworkLog.customPrinter(err.toString());
      NetworkLog.customPrinter(stackTrace.toString());
      return null;
    } catch (e, err) {
      NetworkLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
      NetworkLog.customPrinter("❌❌❌  unlisted error received");
      NetworkLog.customPrinter("❌❌❌ $e");
      NetworkLog.customPrinter("❌❌❌ $err");
      return null;
    }
  }


  // Post Method
  @override
  Future<Map<String, dynamic>?> post(String url, Map<String, dynamic>? body,) async {
    prevReport(method: "POST", url: url, body: body);

    try {
      final response = await http
          .post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {"Content-Type": "application/json"},
      ).timeout(const Duration(seconds: 60));
      responseReport(method: "POST", response: response.body.toString());

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 406) {

        NetworkLog.customPrinter("🐞🐞🐞 Error Alert 406 🐞🐞🐞");
        return null;

      } else if (response.statusCode == 500) {

        NetworkLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
        return null;

      } else if (response.statusCode == 401) {

        NetworkLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
        NetworkLog.customPrinter("Hit Here!**|token-expire|******* $url");
        return null;

      } else {

        NetworkLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
        NetworkLog.customPrinter("unknown error hit in status code ${jsonDecode(response.body)}");
        return null;

      }
    } on SocketException {

      NetworkLog.customPrinter("🐞🐞🐞 Error Alert on Socket Exception 🐞🐞🐞");
      return null;

    } on TimeoutException {

      NetworkLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
      NetworkLog.customPrinter("Time out exception $url");
      return null;

    } on http.ClientException catch (err, stackTrace) {
      NetworkLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
      NetworkLog.customPrinter("client exception hit");
      NetworkLog.customPrinter(err.toString());
      NetworkLog.customPrinter(stackTrace.toString());
      return null;
    } catch (e, err) {
      NetworkLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
      NetworkLog.customPrinter("❌❌❌  unlisted error received");
      NetworkLog.customPrinter("❌❌❌ $e");
      NetworkLog.customPrinter("❌❌❌ $err");
      return null;
    }
  }


  //Put Method
  @override
  Future<Map<String, dynamic>?> put(String url, Map<String, dynamic>? body) async {
    prevReport(method: "PUT", url: url, body: body);

    try {
      final response = await http.put(Uri.parse(url),
        body: jsonEncode(body),
        headers: {"Content-Type": "application/json"},
      ).timeout(const Duration(seconds: 60));
      responseReport(method: "PUT", response: response.body.toString());

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 406) {
        NetworkLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
        return null;
      } else if (response.statusCode == 400) {

        NetworkLog.customPrinter("🐞🐞🐞 Error Alert 400 || ${response.statusCode} 🐞🐞🐞");
        return null;

      } else if (response.statusCode == 401) {

        NetworkLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
        NetworkLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
        NetworkLog.customPrinter("Hit Here!**|token-expire|* $url");
        NetworkLog.customPrinter("Invalid Token");
        return null;

      } else {

        NetworkLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
        NetworkLog.customPrinter("unknown error hit in status code ${jsonDecode(response.body)}");
        return null;

      }
    } on SocketException {

      NetworkLog.customPrinter("🐞🐞🐞 Error Alert on Socket Exception 🐞🐞🐞");
      return null;

    } on TimeoutException {

      NetworkLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
      NetworkLog.customPrinter("Time out exception $url");
      return null;

    } on http.ClientException catch (err, stackTrace) {

      NetworkLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
      NetworkLog.customPrinter("client exception hit");
      NetworkLog.customPrinter(err.toString());
      NetworkLog.customPrinter(stackTrace.toString());
      return null;

    } catch (e) {
      NetworkLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
      NetworkLog.customPrinter("unlisted catch error received");
      NetworkLog.customPrinter(e.toString());
      return null;
    }
  }


  // Delete Method
  @override
  Future<Map<String, dynamic>?> delete(String url) async {
    prevReport(method: "DELETE", url: url);

    try {
      final response = await http
          .delete(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
      ).timeout(const Duration(seconds: 60));

      responseReport(
        method: "DELETE",
        response: response.body,
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {

        NetworkLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
        NetworkLog.customPrinter("Hit Here!**|token-expire|*******$url");
        return null;

      } else if (response.statusCode == 406) {

        NetworkLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
        return null;

      }else {
        NetworkLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");

        NetworkLog.customPrinter("unknown error hitted in status code ${jsonDecode(response.body)}");
        return null;
      }
    } on SocketException {

      NetworkLog.customPrinter("🐞🐞🐞 Error Alert on Socket Exception 🐞🐞🐞");
      return null;

    } on TimeoutException {

      NetworkLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
      NetworkLog.customPrinter("Time out exception $url");

      return null;
    } on http.ClientException catch (err, stackTrace) {

      NetworkLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
      NetworkLog.customPrinter("client exception hit");
      NetworkLog.customPrinter(err.toString());
      NetworkLog.customPrinter(stackTrace.toString());
      return null;

    } catch (e, err) {

      NetworkLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
      NetworkLog.customPrinter("❌❌❌  unlisted error received");
      NetworkLog.customPrinter("❌❌❌ $e");
      NetworkLog.customPrinter("❌❌❌ $err");
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

    NetworkLog.customPrinterYellow("[METHOD] : $method");
    NetworkLog.customPrinterYellow("[url] : $url");
    NetworkLog.customPrinterWhite("[body] : $body");
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
    NetworkLog.customPrinterGreen("[METHOD] : $method");
    NetworkLog.customPrinterGreen("[url] : $response");
    print("|🌱|");
    print("|-------");
  }





}