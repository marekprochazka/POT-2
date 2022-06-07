import 'dart:math';

import 'package:app/models/data/base.dart';
import 'package:app/models/data/overload_definition.dart';

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
  OverloadDefinition overloadDefinition;
  int? order;
  String? description;
  double? defaultAddOverloadValue;
  String? lastOverloadValue;

  Exercise({
    required String id,
    this.exerciseName,
    required this.overloadDefinition,
    this.order,
    this.description,
    this.defaultAddOverloadValue,
    this.lastOverloadValue,
    String? xCreated,
    String? xModified,
  }) : super(id: id, xCreated: xCreated, xModified: xModified);

  static Future<Exercise> getNew() async {
    Random random = Random();
    return Exercise(
      id: '${random.nextInt(1000000)}',
      overloadDefinition: OverloadDefinition(id: '${random.nextInt(1000000)}'),
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