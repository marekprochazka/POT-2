

import 'dart:convert';

import 'package:app/models/data/training_plan.dart';
import 'package:app/models/environment.dart';
import 'package:app/reverse/reverse.dart';
import 'package:http/http.dart' as http;

class POTApiProvider {
  final String apiUrl = Environ.apiUrl;
  final String userToken;

  POTApiProvider(this.userToken);

  Future<http.Response> _get(String reverseStr, [Map? params]) {
    print('$apiUrl/${reverse(reverseStr, params)}');
    return http.get(
      Uri.parse('$apiUrl/${reverse(reverseStr, params)}'),
      headers: {
        'Authorization': 'TOKEN $userToken',
        'Content-Type': 'application/json',
      });
  }

  Future<List<TrainingPlan>> getPlans() async {
    print('fetching plans');
    final response = await _get('workout:training_plan');
      print('got em');

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((e) => TrainingPlan.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load training plans');
    }
  }

}