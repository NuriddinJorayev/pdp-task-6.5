// ignore_for_file: null_check_always_fails, camel_case_types, non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pdp_task_6_5/models/User.dart';

class Rest_APi {
  static String base = "dummy.restapiexample.com";
  static String apiGet = "/api/v1/employees";
  static String apiGetId = "/api/v1/employee/";
  static String apiPost = "/api/v1/create";
  static String apiPut = "/api/v1/update/";
  static String apiDelete = "/api/v1/delete/";
  static Map<String, String> apiHeader = {
    "name": "test",
    "salary": "123",
    "age": "23"
  };
  // get mathod
  static Future<String> get(String api_url, Map<String, String> param) async {
    var uri = Uri.http(base, api_url);
    var response = await http.get(uri, headers: apiHeader);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null!;
  }

  // get with id mathod
  static Future<String> getWithId(String api_url, String id, Map<String, String> param) async {
    var uri = Uri.http(base, api_url + id);
    var response = await http.get(uri, headers: apiHeader);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null!;
  }

  // post mathod
  static Future<String> Post(String api_url, Map<String, String> param) async {
    var uri = Uri.http(base, api_url);
    var response = await http.post(uri, headers: apiHeader, body: jsonEncode(param));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null!;
  }

  // put mathod
  static Future<String> Put(
      String api_url, String id, Map<String, String> param) async {
    var uri = Uri.http(base, api_url + id);
    var response = await http.put(uri, headers: apiHeader, body: jsonEncode(param));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null!;
  }

  // get mathod
  static Future<String> Del(
      String api_url, String id, Map<String, String> param) async {
    var uri = Uri.http(base, api_url + id);
    var response = await http.delete(uri, headers: apiHeader);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null!;
  }

  static Map<String, String> EmptyParam() {
    Map<String, String> param = {};
    return param;
  }

  static Map<String, String> PostParam(var user) {
    Map<String, String> param = {
      'name': user.name,
      'salary': user.salary,
      'age': user.age,
      'userid': user.userid.toString(),
    };
    return param;
  }

  static Map<String, String> PutParam(var user) {
    Map<String, String> param = {
      'id': user.id.toString(),
      'name': user.name,
      'salary': user.salary,
      'age': user.age,
      'userid': user.userid.toString(),
    };
    return param;
  }
}
