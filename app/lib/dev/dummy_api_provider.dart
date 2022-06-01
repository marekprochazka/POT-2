import 'package:app/models/data/exercise.dart';
import 'package:app/models/data/training.dart';
import 'package:app/models/data/training_plan.dart';

class POTDummyAPI {
  static Future<List<TrainingPlan>> getPlans() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      TrainingPlan(
          id: '1',
          planName: 'Prvni plan',
          trainings: [],
          xCreated: '2022-11-1',
          xModified: '2022-11-1',
          planImage:
              '/media/training_plan/2022/03/28/c871eb13-8b1b-4ef2-acd2-91eb2aa55463.png',
              description: 'Some short description'),
      TrainingPlan(
          id: '2',
          planName: 'Druhy plan',
          trainings: [],
          xCreated: '2022-11-1',
          xModified: '2022-11-1',
          planImage:
              '/media/training_plan/2022/03/28/c871eb13-8b1b-4ef2-acd2-91eb2aa55463.png',
              description: 'Some short description'),
      TrainingPlan(
          id: '3',
          planName: 'Treti plan',
          trainings: [],
          xCreated: '2022-11-1',
          xModified: '2022-11-1',
          planImage:
              '/media/training_plan/2022/03/28/c871eb13-8b1b-4ef2-acd2-91eb2aa55463.png',
              description: 'Some short description'),
      TrainingPlan(
          id: '4',
          planName: 'Ctvrty plan',
          trainings: [],
          xCreated: '2022-11-1',
          xModified: '2022-11-1',
          planImage:
              '/media/training_plan/2022/03/28/c871eb13-8b1b-4ef2-acd2-91eb2aa55463.png',
              description: 'Some veeery long description, Some veeery long description,Some veeery long description,Some veeery long description,Some veeery long description'),
              // description: 'Some short description'),

    ];
  }

  static Future<TrainingPlan> getPlan(String id) async {
    await Future.delayed(const Duration(seconds: 2));
    return TrainingPlan(
        id: id,
        planName: 'Prvni plan',
        trainings: [],
        xCreated: '2022-11-1',
        xModified: '2022-11-1',
        planImage:
            '/media/training_plan/2022/03/28/c871eb13-8b1b-4ef2-acd2-91eb2aa55463.png',
            description: 'Some short description');
  }

  static Future<List<Training>> getTrainings(String planId) async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      Training(id: '1', trainingName: 'Monday chest',xCreated: '1', xModified: '1', exercises: [
        Exercise(id: '1', exerciseName: 'Bench press', lastOverloadValue: '10 kg', order: 0, description: 'Some description', xCreated: '1', xModified: '1'),
        Exercise(id: '2', exerciseName: 'Chest flies', order: 1, description: 'Some description', xCreated: '1', xModified: '1'),
        Exercise(id: '3', exerciseName: 'Overhead press', lastOverloadValue: '10 kg', order: 2, xCreated: '1', xModified: '1'),
        Exercise(id: '4', exerciseName: 'Pullover', lastOverloadValue: '10 kg', order: 2, xCreated: '1', xModified: '1'),
        Exercise(id: '5', exerciseName: 'Triceps pump', lastOverloadValue: '10 kg', order: 2, xCreated: '1', xModified: '1'),
        Exercise(id: '6', exerciseName: 'Biceps pump cause why not lol', lastOverloadValue: '10 kg', order: 2, xCreated: '1', xModified: '1'),
        Exercise(id: '6', exerciseName: 'Biceps pump cause why not lol', lastOverloadValue: '10 kg', order: 2, xCreated: '1', xModified: '1'),
        Exercise(id: '7', exerciseName: 'Biceps pump cause why not lol', lastOverloadValue: '10 kg', order: 2, xCreated: '1', xModified: '1'),
        Exercise(id: '8', exerciseName: 'Biceps pump cause why not lol', lastOverloadValue: '10 kg', order: 2, xCreated: '1', xModified: '1'),
        Exercise(id: '9', exerciseName: 'Biceps pump cause why not lol', lastOverloadValue: '10 kg', order: 2, xCreated: '1', xModified: '1'),
        ]),
      Training(id: '2', trainingName: 'Tuesday back',xCreated: '1', xModified: '1', exercises: [
        Exercise(id: '1', exerciseName: 'Pullover', lastOverloadValue: '10 kg', order: 0, description: 'Some description', xCreated: '1', xModified: '1'),
        Exercise(id: '2', exerciseName: 'Low row', order: 1, description: 'Some description', xCreated: '1', xModified: '1'),
        Exercise(id: '3', exerciseName: 'Pullups', lastOverloadValue: '10 kg', order: 2, xCreated: '1', xModified: '1'),
        ]),
      Training(id: '3', trainingName: 'Wednesday Legs',xCreated: '1', xModified: '1', exercises: [
        Exercise(id: '1', exerciseName: 'Squat', lastOverloadValue: '10 kg', order: 0, description: 'Some description', xCreated: '1', xModified: '1'),
        Exercise(id: '2', exerciseName: 'Extensions', order: 1, description: 'Some description', xCreated: '1', xModified: '1'),
        Exercise(id: '3', exerciseName: 'Curls', lastOverloadValue: '10 kg', order: 2, xCreated: '1', xModified: '1'),
        ]),
      Training(id: '4', trainingName: 'Sunday cardio',xCreated: '1', xModified: '1', exercises: [
        Exercise(id: '1', exerciseName: 'Jump rope', lastOverloadValue: '10 kg', order: 0, description: 'Some description', xCreated: '1', xModified: '1'),
        Exercise(id: '2', exerciseName: 'Sprints', order: 1, description: 'Some description', xCreated: '1', xModified: '1'),
        Exercise(id: '3', exerciseName: 'Lunges', lastOverloadValue: '10 kg', order: 2, xCreated: '1', xModified: '1'),
        ]),

    ];
  }
}
