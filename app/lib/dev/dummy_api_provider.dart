import 'package:app/models/data/exercise.dart';
import 'package:app/models/data/overload.dart';
import 'package:app/models/data/overload_definition.dart';
import 'package:app/models/data/training.dart';
import 'package:app/models/data/training_active.dart';
import 'package:app/models/data/training_plan.dart';

class POTDummyAPI {


  static Future<TrainingActive> getLastTrainingActive(String trainingId) async {
    await Future.delayed(const Duration(seconds: 2));
    return TrainingActive(id: '1', trainingName: 'Monday chest', overloads: [
      Overload(
          id: '1',
          exerciseName: 'Bench press',
          exerciseId: '1',
          overloadUnit: 'kg'),
      Overload(
          id: '2',
          exerciseName: 'Chest flies',
          exerciseId: '2',
          overloadUnit: 'kg',
          defaultAddOverloadValue: 5),
      Overload(
          id: '3',
          value: '10',
          exerciseName: 'Overhead press',
          exerciseId: '3',
          overloadUnit: 'kg',
          defaultAddOverloadValue: 5),
    ]);
  }
}
