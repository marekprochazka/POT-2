import 'package:app/constants.dart';
import 'package:app/models/data/training_active.dart';
import 'package:app/providers/api_provider.dart';

mixin TrainingActiveMixin on BaseApiProvider {
  Future<TrainingActive> getLastTrainingActive(String trainingId) async {
    return await handleResponse(
      () => get('workout:training_active', params: {'training_id': trainingId}),
      (response) => TrainingActive.fromJson(decode(response)),
      HTTPStatusOK.get,
    );
  }

  Future<void> setMultipleOverloads(
      String trainingActiveId, List<Map<String, dynamic>> body) async {
    return await handleResponse(
      () => put('workout:training_active_set_multiple_overloads',
          params: {
            'training_active_id': trainingActiveId,
          },
          body: body),
      (_) {},
      HTTPStatusOK.put,
    );
  }

  Future<void> finishTrainingActive(String trainingActiveId) async {
    return await handleResponse(
      () => get('workout:training_active_finish', params: {
        'training_active_id': trainingActiveId,
      }),
      (_) {},
      HTTPStatusOK.get,
    );
  }
}
