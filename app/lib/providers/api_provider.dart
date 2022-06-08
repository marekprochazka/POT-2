import 'dart:convert';

import 'package:app/models/data/training_plan.dart';
import 'package:app/models/data/user.dart';
import 'package:app/models/environment.dart';
import 'package:app/reverse/reverse.dart';
import 'package:app/utils/exceptions.dart';
import 'package:http/http.dart' as http;

class POTApiProvider {
  final String apiUrl = Environ.apiUrl;
  String? userToken;

  POTApiProvider(this.userToken);

  Map<String, String> getHeaders() {
    return {
      'Authorization': userToken != null ? 'TOKEN $userToken' : '',
      'Content-Type': 'application/json',
      'chartset': 'utf-8',
    };
  }

  dynamic _decode(http.Response response) {
    try {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      throw Exception(e.toString());
    }
  } 

  Future<http.Response> _get(String reverseStr, {Map? params}) {
    return http.get(
      Uri.parse('$apiUrl/${reverse(reverseStr, params)}'),
      headers: getHeaders(),
    );
  }

  Future<http.Response> _post(String reverseStr, {Map? params, Map? body}) {
    return http.post(
      Uri.parse('$apiUrl/${reverse(reverseStr, params)}'),
      headers: getHeaders(),
      body: jsonEncode(body ?? {}),
    );
  }

  Future<User> login(String username, String password) async {
    final response = await _post('my_auth:login', body: {
      'username': username,
      'password': password,
    });
    if (response.statusCode == 201) {
      final user = User.fromJson(_decode(response));
      userToken = user.token;
      return user;
    } else if (response.statusCode == 400) {
      throw BadRequestException(_decode(response));
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<void> logout() async {
    final response = await _get('my_auth:logout');
    if (response.statusCode == 200) {
      userToken = null;
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<List<TrainingPlan>> getPlans() async {
    final response = await _get('workout:training_plan');

    if (response.statusCode == 200) {
      return (_decode(response) as List)
          .map((e) => TrainingPlan.fromJson(e))
          .toList();
    } else if (response.statusCode == 401) {
      throw UnauthorizedException(
          'Failed to load training plans. Unauthorized');
    } else {
      throw Exception('Something went wrong');
    }
  }
}
