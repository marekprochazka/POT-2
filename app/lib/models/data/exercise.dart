class ExerciseLite {
  final String id;
  final String exerciseName;
  final String? lastOverloadValue;
  final int order;
  final String? description;

  ExerciseLite({
    required this.id,
    required this.exerciseName,
    this.lastOverloadValue,
    required this.order,
    this.description,
  });
}