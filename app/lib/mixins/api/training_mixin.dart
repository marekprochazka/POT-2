import 'package:app/constants.dart';
import 'package:app/models/data/training.dart';
import 'package:app/providers/api_provider.dart';
import 'package:app/utils/exceptions.dart';

mixin TrainingMixin on BaseApiProvider {
  Future<List<Training>> getTrainings(String planId) async {
    return await handleResponse(
        () => get('workout:training', params: {'training_plan_id': planId}),
        (response) => (decode(response) as List)
            .map((e) => Training.fromJson(e))
            .toList(),
        HTTPStatusOK.get);
  }

  Future<Training> getNewTraining(String planId) async {
    return await handleResponse(
        () => post('workout:training', params: {'training_plan_id': planId}),
        (response) => Training.fromJson(decode(response)),
        HTTPStatusOK.post);
  }

  Future<Training> getTraining(String planId, String trainingId) async {
    return await handleResponse(
        () => get('workout:training',
            params: {'training_plan_id': planId, 'training_id': trainingId}),
        (response) => Training.fromJson(decode(response)),
        HTTPStatusOK.get);
  }

  Future<Training> updateTraining(String planId, Training training) async {
    return await handleResponse(
        () => patch('workout:training', params: {
              'training_plan_id': planId,
              'training_id': training.id
            }, body: {
              'training_name': training.trainingName,
            }),
        (response) => Training.fromJson(decode(response)),
        HTTPStatusOK.patch);
  }

  Future<void> deleteTraining(String planId, String trainingId) async {
    return await handleResponse(
        () => delete('workout:training',
            params: {'training_plan_id': planId, 'training_id': trainingId}),
        (_) {},
        HTTPStatusOK.delete);
  }
}
