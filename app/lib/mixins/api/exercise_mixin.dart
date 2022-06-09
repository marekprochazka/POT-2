

import 'package:app/constants.dart';
import 'package:app/models/data/exercise.dart';
import 'package:app/providers/api_provider.dart';

mixin ExerciseMixin on BaseApiProvider {
  Future<Exercise> getNewExercise(String trainingId) async {
    return await handleResponse(
      () => post('workout:exercise', params: {'training_id': trainingId}), 
      (response) => Exercise.fromJson(decode(response)), 
      HTTPStatusOK.post);
  }

  Future<Exercise> getExercise(String trainingId, String exerciseId) async {
    return await handleResponse(
      () => get('workout:exercise', params: {
        'training_id': trainingId,
        'exercise_id': exerciseId,
      }), 
      (response) => Exercise.fromJson(decode(response)), 
      HTTPStatusOK.get);
  }

  Future<Exercise> updateExercise(String trainingId, Exercise exercise) async {
    return await handleResponse(
      () => patch('workout:exercise', params: {
        'training_id': trainingId,
        'exercise_id': exercise.id,
      }, body: {
        'exercise_name': exercise.exerciseName,
        'overload_definition': {
          'unit': exercise.overloadDefinition.unit,
          'data_type':exercise.overloadDefinition.dataType,
        },
        'description': exercise.description,
        'default_add_overload_value': exercise.defaultAddOverloadValue
      }), 
      (response) => Exercise.fromJson(decode(response)), 
      HTTPStatusOK.patch);
  }

  Future<void> deleteExercise(String trainingId, String exerciseId) async {
    return await handleResponse(
      () => delete('workout:exercise', params: {
        'training_id': trainingId,
        'exercise_id': exerciseId,
      }), 
      (_) {}, 
      HTTPStatusOK.delete);
  }
}