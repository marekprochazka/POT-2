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
      Training(id: '1', trainingName: 'Monday chest', exercises: [
        ExerciseLite(id: '1', exerciseName: 'Bench press', lastOverloadValue: '10 kg', order: 0, description: 'Some description'),
        ExerciseLite(id: '2', exerciseName: 'Chest flies', order: 1, description: 'Some description'),
        ExerciseLite(id: '3', exerciseName: 'Overhead press', lastOverloadValue: '10 kg', order: 2),
        ]),
      Training(id: '2', trainingName: 'Tuesday back', exercises: [
        ExerciseLite(id: '1', exerciseName: 'Bench press', lastOverloadValue: '10 kg', order: 0, description: 'Some description'),
        ExerciseLite(id: '2', exerciseName: 'Chest flies', order: 1, description: 'Some description'),
        ExerciseLite(id: '3', exerciseName: 'Overhead press', lastOverloadValue: '10 kg', order: 2),
        ]),
      Training(id: '3', trainingName: 'Wednesday Legs', exercises: [
        ExerciseLite(id: '1', exerciseName: 'Bench press', lastOverloadValue: '10 kg', order: 0, description: 'Some description'),
        ExerciseLite(id: '2', exerciseName: 'Chest flies', order: 1, description: 'Some description'),
        ExerciseLite(id: '3', exerciseName: 'Overhead press', lastOverloadValue: '10 kg', order: 2),
        ]),
      Training(id: '4', trainingName: 'Sunday cardio', exercises: [
        ExerciseLite(id: '1', exerciseName: 'Bench press', lastOverloadValue: '10 kg', order: 0, description: 'Some description'),
        ExerciseLite(id: '2', exerciseName: 'Chest flies', order: 1, description: 'Some description'),
        ExerciseLite(id: '3', exerciseName: 'Overhead press', lastOverloadValue: '10 kg', order: 2),
        ]),

    ];
  }
}
