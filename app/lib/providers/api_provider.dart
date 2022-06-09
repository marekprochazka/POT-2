import 'dart:convert';

import 'package:app/constants.dart';
import 'package:app/mixins/api/auth_mixin.dart';
import 'package:app/mixins/api/exercise_mixin.dart';
import 'package:app/mixins/api/training_active_mixin.dart';
import 'package:app/mixins/api/training_mixin.dart';
import 'package:app/mixins/api/training_plan_mixin.dart';
import 'package:app/models/data/training_plan.dart';
import 'package:app/models/data/user.dart';
import 'package:app/models/environment.dart';
import 'package:app/reverse/reverse.dart';
import 'package:app/utils/exceptions.dart';
import 'package:http/http.dart' as http;

class BaseApiProvider {
  final String apiUrl = Environ.apiUrl;
  String? userToken;

  BaseApiProvider(this.userToken);

  Map<String, String> getHeaders() {
    return {
      'Authorization': userToken != null ? 'TOKEN $userToken' : '',
      'Content-Type': 'application/json',
      'chartset': 'utf-8',
    };
  }

  dynamic decode(http.Response response) {
    try {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<http.Response> get(String reverseStr, {Map? params}) {
    return http.get(
      Uri.parse('$apiUrl/${reverse(reverseStr, params)}'),
      headers: getHeaders(),
    );
  }

  Future<http.Response> post(String reverseStr, {Map? params, Map? body}) {
    return http.post(
      Uri.parse('$apiUrl/${reverse(reverseStr, params)}'),
      headers: getHeaders(),
      body: jsonEncode(body ?? {}),
    );
  }

  Future<http.Response> patch(String reverseStr, {Map? params, Map? body}) {
    return http.patch(
      Uri.parse('$apiUrl/${reverse(reverseStr, params)}'),
      headers: getHeaders(),
      body: jsonEncode(body ?? {}),
    );
  }

  Future<http.Response> put(String reverseStr, {Map? params, dynamic body}) {
    return http.put(
      Uri.parse('$apiUrl/${reverse(reverseStr, params)}'),
      headers: getHeaders(),
      body: jsonEncode(body ?? {}),
    );
  }

  Future<http.Response> delete(String reverseStr, {Map? params}) {
    return http.delete(
      Uri.parse('$apiUrl/${reverse(reverseStr, params)}'),
      headers: getHeaders(),
    );
  }

  Future<T> handleResponse<T>(Future<http.Response> Function() apiCall,
      T Function(http.Response) callback, int statusOk) async {
    final response = await apiCall();
    if (response.statusCode == statusOk) {
      return callback(response);
    } else if (response.statusCode == 401) {
      throw UnauthorizedException(decode(response));
    } else {
      throw Exception('Something went wrong');
    }
  }
}

class POTApiProvider extends BaseApiProvider
    with
        AuthMixin,
        TrainingPlanMixin,
        TrainingMixin,
        ExerciseMixin,
        TrainingActiveMixin {
  POTApiProvider(String? userToken) : super(userToken);
}
