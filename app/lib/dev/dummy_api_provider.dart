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
              '/media/training_plan/2022/02/27/c871eb13-8b1b-4ef2-acd2-91eb2aa55463.jfif'),
      TrainingPlan(
          id: '2',
          planName: 'Druhy plan',
          trainings: [],
          xCreated: '2022-11-1',
          xModified: '2022-11-1',
          planImage:
              '/media/training_plan/2022/02/27/c871eb13-8b1b-4ef2-acd2-91eb2aa55463.jfif'),
      TrainingPlan(
          id: '3',
          planName: 'Treti plan',
          trainings: [],
          xCreated: '2022-11-1',
          xModified: '2022-11-1',
          planImage:
              '/media/training_plan/2022/02/27/c871eb13-8b1b-4ef2-acd2-91eb2aa55463.jfif'),
      TrainingPlan(
          id: '4',
          planName: 'Ctvrty plan',
          trainings: [],
          xCreated: '2022-11-1',
          xModified: '2022-11-1',
          planImage:
              '/media/training_plan/2022/02/27/c871eb13-8b1b-4ef2-acd2-91eb2aa55463.jfif'),
    ];
  }
}
