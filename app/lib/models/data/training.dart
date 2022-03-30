import 'package:app/models/data/exercise.dart';

class TrainingLite {
  final String id;
  final String name;

  TrainingLite({required this.id, required this.name});
}

class Training {
  final String id;
  final String trainingName;  
  final List<ExerciseLite> exercises;

  Training({required this.id, required this.trainingName, required this.exercises});
}