import 'package:app/models/data/training_plan.dart';
import 'package:app/providers/api_provider.dart';
import 'package:app/utils/exceptions.dart';

mixin TrainingPlanMixin on BaseApiProvider {
  Future<List<TrainingPlan>> getPlans() async {
    final response = await get('workout:training_plan');

    if (response.statusCode == 200) {
      return (decode(response) as List)
          .map((e) => TrainingPlan.fromJson(e))
          .toList();
    } else if (response.statusCode == 401) {
      throw UnauthorizedException(
          'Failed to load training plans. Unauthorized');
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<TrainingPlan> getNewPlan() async {
    final response = await post('workout:training_plan');

    if (response.statusCode == 201) {
      return TrainingPlan.fromJson(decode(response));
    } else if (response.statusCode == 401) {
      throw UnauthorizedException(decode(response));
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<TrainingPlan> getPlan(String planId) async {
    final response = await get('workout:training_plan', params: {'training_plan_id': planId});

    if (response.statusCode == 200) {
      return TrainingPlan.fromJson(decode(response));
    } else if (response.statusCode == 401) {
      throw UnauthorizedException(decode(response));
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<TrainingPlan> updatePlan(TrainingPlan plan) async {
    final response = await patch('workout:training_plan',
        params: {
          'training_plan_id': plan.id,
        },
        body: {
          'plan_name': plan.planName,
          'description': plan.description,
        });

    if (response.statusCode == 200) {
      return TrainingPlan.fromJson(decode(response));
    } else if (response.statusCode == 401) {
      throw UnauthorizedException(decode(response));
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<void> deletePlan(String planId) async {
    final response = await delete('workout:training_plan',
        params: {
          'training_plan_id': planId,
        });

    if (response.statusCode == 204) {
      return;
    } else if (response.statusCode == 401) {
      throw UnauthorizedException(decode(response));
    } else {
      throw Exception('Something went wrong');
    }
  }
}
