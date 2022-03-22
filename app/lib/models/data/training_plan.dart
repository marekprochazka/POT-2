import 'package:app/models/data/training.dart';

class TrainingPlan {
  final String id;
  final String planName;
  final List<Training> trainings;
  final String xCreated;
  final String xModified;
  final String planImage;

  TrainingPlan(
      {required this.id,
      required this.planName,
      required this.trainings,
      required this.xCreated,
      required this.xModified,
      required this.planImage});
}
