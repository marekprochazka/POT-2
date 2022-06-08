

import 'package:app/models/data/training.dart';
import 'package:app/providers/api_provider.dart';
import 'package:app/utils/exceptions.dart';

mixin TrainingMixin on BaseApiProvider {
  Future<List<Training>> getTrainings(String planId) async {
    final response = await get('workout:training', params: {'training_plan_id': planId});

    if (response.statusCode == 200) {
      return (decode(response) as List)
          .map((e) => Training.fromJson(e))
          .toList();
    } else if (response.statusCode == 401) {
      throw UnauthorizedException(decode(response));
    } else {
      throw Exception('Something went wrong');
    }
  }
}