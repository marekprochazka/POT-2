import 'dart:math';

import 'package:app/models/data/base.dart';

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


class Exercise extends BaseModel {
  String? exerciseName;
  String? overloadUnit;
  String? overloadType;
  int? order;
  String? description;
  double? defaultAddOverloadValue;
  String? lastOverloadValue;

  Exercise({
    required String id,
    this.exerciseName,
    this.overloadUnit,
    this.overloadType,
    this.order,
    this.description,
    this.defaultAddOverloadValue,
    this.lastOverloadValue,
    required String xCreated,
    required String xModified,
  }) : super(id: id, xCreated: xCreated, xModified: xModified);

  static Future<Exercise> getNew() async {
    Random random = Random();
    return Exercise(
      id: '${random.nextInt(1000000)}',
      xCreated: DateTime.now().toIso8601String(),
      xModified: DateTime.now().toIso8601String(),
    );
  }

  @override
  Future<void> save() async {
    print('$exerciseName saved');
  }

  @override
  Future<void> destroy() async {
    print('$exerciseName destroyed');
  }

}