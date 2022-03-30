import 'package:app/models/data/training.dart';

class TrainingPlan {
  final String id;
  final String planName;
  final List<TrainingLite> trainings;
  final String xCreated;
  final String xModified;
  final String planImage;
  final String description;

  TrainingPlan(
      {required this.id,
      required this.planName,
      required this.trainings,
      required this.xCreated,
      required this.xModified,
      required this.planImage,
      required this.description});
}
