import 'package:app/constants.dart';
import 'package:app/models/data/training_plan.dart';
import 'package:app/providers/api_provider.dart';

mixin TrainingPlanMixin on BaseApiProvider {
  Future<List<TrainingPlan>> getPlans() async {
    return await handleResponse(
        () => get('workout:training_plan'),
        (response) => (decode(response) as List)
            .map((e) => TrainingPlan.fromJson(e))
            .toList(),
        HTTPStatusOK.get);
  }

  Future<TrainingPlan> getNewPlan() async {
    return await handleResponse(
      () => post('workout:training_plan'),
      (response) => TrainingPlan.fromJson(decode(response)),
      HTTPStatusOK.post,
    );
  }

  Future<TrainingPlan> getPlan(String planId) async {
    return await handleResponse(
        () =>
            get('workout:training_plan', params: {'training_plan_id': planId}),
        (response) => TrainingPlan.fromJson(decode(response)),
        HTTPStatusOK.get);
  }

  Future<TrainingPlan> updatePlan(TrainingPlan plan) async {
    return await handleResponse(
        () => patch('workout:training_plan', params: {
              'training_plan_id': plan.id,
            }, body: {
              'plan_name': plan.planName,
              'description': plan.description,
            }),
        (response) => TrainingPlan.fromJson(decode(response)),
        HTTPStatusOK.patch);
  }

  Future<void> deletePlan(String planId) async {
    return await handleResponse(
        () => delete('workout:training_plan', params: {
              'training_plan_id': planId,
            }),
        (_) {},
        HTTPStatusOK.delete);
  }
}
